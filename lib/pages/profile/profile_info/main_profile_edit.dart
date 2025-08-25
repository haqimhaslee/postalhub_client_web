import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ProfileMainEdit extends StatefulWidget {
  const ProfileMainEdit({super.key});

  @override
  State<ProfileMainEdit> createState() => _ProfileMainEditState();
}

class _ProfileMainEditState extends State<ProfileMainEdit> {
  late Future<DocumentSnapshot> _userFuture;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  String? profilePicUrl;
  String? uid;
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _userFuture = fetchUserData();
  }

  Future<DocumentSnapshot> fetchUserData() async {
    uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw Exception("User not logged in");

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('client_user')
        .doc(uid)
        .get();

    final data = snapshot.data() as Map<String, dynamic>;
    _usernameController.text = data['username'] ?? '';
    _phoneController.text = data['phone_no'] ?? '';

    final birthday = data['birthday'];
    if (birthday is Timestamp) {
      _birthdayController.text =
          birthday.toDate().toIso8601String().split('T').first;
    } else if (birthday is String) {
      _birthdayController.text = birthday;
    }

    profilePicUrl = data['profilePic'];

    return snapshot;
  }

  Future<void> saveProfileChanges() async {
    if (!_formKey.currentState!.validate()) return;

    final birthdayText = _birthdayController.text.trim();
    Timestamp? birthdayTimestamp;
    if (birthdayText.isNotEmpty) {
      birthdayTimestamp = Timestamp.fromDate(DateTime.parse(birthdayText));
    }

    String? uploadedImageUrl;

    if (_selectedImage != null) {
      final fileName = path.basename(_selectedImage!.path);

      final isSameAsCurrent =
          profilePicUrl != null && profilePicUrl!.contains(fileName);

      if (!isSameAsCurrent) {
        // DELETE OLD PIC
        if (profilePicUrl != null && profilePicUrl!.isNotEmpty) {
          try {
            final oldRef = FirebaseStorage.instance.refFromURL(profilePicUrl!);
            await oldRef.delete();
          } catch (e) {
            debugPrint("Failed to delete old profile picture: $e");
          }
        }

        // UPLOAD NEW PIC
        final ref = FirebaseStorage.instance
            .ref()
            .child('profile_pics')
            .child(uid!)
            .child(fileName);

        await ref.putFile(_selectedImage!);
        uploadedImageUrl = await ref.getDownloadURL();
      }
    }

    await FirebaseFirestore.instance.collection('client_user').doc(uid).update({
      'username': _usernameController.text.trim(),
      'phone_no': _phoneController.text.trim(),
      'birthday': birthdayTimestamp,
      if (uploadedImageUrl != null) 'profilePic': uploadedImageUrl,
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully!")),
      );
      Navigator.of(context).pop();
    }

    setState(() {
      if (uploadedImageUrl != null) profilePicUrl = uploadedImageUrl;
      _selectedImage = null;
    });
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (_selectedImage?.path != pickedFile.path) {
        setState(() => _selectedImage = File(pickedFile.path));
      }
    }
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          DateTime.tryParse(_birthdayController.text) ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      _birthdayController.text = picked.toIso8601String().split('T').first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_rounded),
            tooltip: "Save changes",
            onPressed: saveProfileChanges,
          ),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError ||
              !snapshot.hasData ||
              !snapshot.data!.exists) {
            return const Center(
              child: Text('An error occurred.\nFailed to load user data.'),
            );
          }

          return Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: pickImage,
                      child: ClipOval(
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: _selectedImage != null
                                  ? FileImage(_selectedImage!)
                                  : (profilePicUrl != null
                                          ? NetworkImage(profilePicUrl!)
                                          : const AssetImage(
                                              'assets/images/profile_image_icon.jpg'))
                                      as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Tap to change profile picture"),
                    const SizedBox(height: 25),
                    profileEditForm(context),
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget profileEditForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Edit Profile Info",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              validator: (value) =>
                  value == null || value.isEmpty ? 'Enter your name' : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                prefixIcon: Icon(Icons.phone_outlined),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _birthdayController,
              readOnly: true,
              onTap: pickDate,
              decoration: const InputDecoration(
                labelText: "Birthday",
                prefixIcon: Icon(Icons.cake_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
