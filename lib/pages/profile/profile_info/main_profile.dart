import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:postalhub_tracker/pages/profile/profile_info/main_profile_edit.dart';
import 'package:intl/intl.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  late Future<DocumentSnapshot> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = fetchUserData();
  }

  Future<DocumentSnapshot> fetchUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      throw Exception("User not logged in");
    }
    return FirebaseFirestore.instance.collection('client_user').doc(uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: "Edit profile",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileMainEdit()));
            },
          ),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              year2023: false,
            ));
          }

          if (snapshot.hasError ||
              !snapshot.hasData ||
              !snapshot.data!.exists) {
            return const Center(
                child: Text('An error occured.\nFailed to load user data.'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          return ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  ClipOval(
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: data['profilePic'] != null
                              ? NetworkImage(data['profilePic'])
                              : const AssetImage(
                                      'assets/images/profile_image_icon.jpg')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(data['username'] ?? 'Username',
                      style: const TextStyle(fontSize: 25)),
                  Text('UID : ${data['uniqueID'] ?? 'Not set yet'}',
                      style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 25),
                  profileInfoCard(context, data),
                  campusInfoCard(context, data),
                  logoutTile(context),
                  const SizedBox(height: 50),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget profileInfoCard(BuildContext context, Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 10, right: 15),
            child: Text(
              "Profile info",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 2, right: 15),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: Material(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ListTile(
                          title: Text(data['username'] ?? ''),
                          subtitle: const Text('Name'),
                          leading: const Icon(
                            Icons.person_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 2, right: 15),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(),
                  child: Material(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ListTile(
                          title: Text(data['email'] ?? ''),
                          subtitle: const Text("Email"),
                          leading: const Icon(
                            Icons.email_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 2, right: 15),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(),
                  child: Material(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ListTile(
                          title: Text(data['phone_no'] ?? ''),
                          subtitle: const Text("Phone number"),
                          leading: const Icon(
                            Icons.phone_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ))),
          Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 2, right: 15),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  child: Material(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ListTile(
                          title: Text(
                            DateFormat.yMMMMd().format(
                                (data['birthday'] as Timestamp).toDate()),
                          ),
                          subtitle: const Text("Birthday"),
                          leading: const Icon(
                            Icons.cake_rounded,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }

  Widget campusInfoCard(BuildContext context, Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: data['campusName'] != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 35, top: 5, bottom: 5, right: 35),
                  child: Divider(
                    thickness: 0.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Text(
                        "Campus/Company info",
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.info_outline_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 2, right: 15),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: ListTile(
                                title: Text(data['campusName'] ?? ''),
                                subtitle: const Text("Name"),
                                leading: const Icon(
                                  Icons.work_rounded,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ))),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 2, right: 15),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: ListTile(
                                title: Text(data['campusId'] ?? ''),
                                subtitle: const Text("ID"),
                                leading: const Icon(
                                  Icons.badge_rounded,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ))),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 2, right: 15),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(),
                        child: Material(
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: ListTile(
                                  title: Text(data['campusRoomAddress'] ?? ''),
                                  subtitle: const Text("Room/Desk address"),
                                  leading: const Icon(
                                    Icons.pin_drop_rounded,
                                    size: 30,
                                  ),
                                  trailing: const Icon(
                                    Icons.chevron_right_rounded,
                                    size: 30,
                                  ),
                                ),
                              ),
                            )))),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 2, right: 15),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: ListTile(
                                title: Text(data['campusEmail'] ?? ''),
                                subtitle: const Text("Email"),
                                leading: const Icon(
                                  Icons.email_rounded,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ))),
              ],
            )
          : null,
    );
  }

  Widget logoutTile(BuildContext context) {
    return ListTile(
      leading: const Padding(
        padding: EdgeInsets.only(left: 15),
        child: Icon(Icons.logout_outlined, color: Colors.red),
      ),
      title: const Text('Log Out', style: TextStyle(color: Colors.red)),
      onTap: () {},
    );
  }
}
