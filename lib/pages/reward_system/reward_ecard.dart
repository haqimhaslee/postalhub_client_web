import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/components/shimmer_loading_animation.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class RewardEcard extends StatefulWidget {
  const RewardEcard({super.key});

  @override
  State<RewardEcard> createState() => _RewardEcardState();
}

class _RewardEcardState extends State<RewardEcard> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser;

  // ignore: unused_field
  String _greeting = "Oh, Hi!";
  String _name = "";
  int _userPoints = 0;
  String _userBarcodeValue = "loading...";
  String? _profilePhotoUrl;
  bool _isLoadingUserData = true;
  bool _isLoadingGreeting = true;
  //bool _errorLoading = false;

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser;
    _fetchGreeting();
    _fetchUserData();
  }

  Future<void> _fetchGreeting() async {
    setState(() {
      _isLoadingGreeting = true;
    });
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('user_experience').get();
      if (snapshot.docs.isNotEmpty) {
        var data = snapshot.docs.first.data() as Map<String, dynamic>;
        if (mounted) {
          setState(() {
            _greeting = data['greeting'] ?? 'Oh, Hi!';
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _greeting = 'Oh, Hi!';
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _greeting = 'Oh, Hi!';
        });
      }
      if (kDebugMode) {
        print("Error fetching greeting: $e");
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingGreeting = false;
        });
      }
    }
  }

  Future<void> _fetchUserData() async {
    if (_currentUser == null) {
      if (mounted) {
        setState(() {
          _name = "Guest";
          _userPoints = 0;
          _userBarcodeValue = "https://www.haqimhaslee.my";
          _isLoadingUserData = false;
        });
      }
      return;
    }

    setState(() {
      _isLoadingUserData = true;
    });

    try {
      DocumentSnapshot userDoc = await _firestore
          .collection('client_user')
          .doc(_currentUser!.uid)
          .get();

      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>;
        if (mounted) {
          setState(() {
            _name = data['username'] ?? 'User';
            _userPoints = data['membershipPoints'] ?? 0;
            _userBarcodeValue = data['uniqueID'] ?? "null";
            _profilePhotoUrl = data['profilePic'];
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _name = "New User";
            _userPoints = 0;
            _userBarcodeValue = _currentUser!.uid;
          });
        }
        if (kDebugMode) {
          print("User document does not exist for UID: ${_currentUser!.uid}");
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {});
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingUserData = false;
        });
      }
    }
  }

  ImageProvider _getProfileImage() {
    if (_profilePhotoUrl != null && _profilePhotoUrl!.isNotEmpty) {
      return NetworkImage(_profilePhotoUrl!);
    }
    return const AssetImage('assets/images/profile_image_icon.jpg');
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingGreeting || _isLoadingUserData) {
      return const RewardEcardOnloading();
    }

    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: 600,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Column(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 0, 5),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: _getProfileImage(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _name,
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSurface),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: 600,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/profile_card.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 5),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/postalhub_logo.jpg'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          const Text(
                                            'POSTAL POINTS',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              _userPoints
                                                  .toString(), // Display fetched points
                                              style: const TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            const Text(
                                              'POINTS',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 5, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Material(
                                            color: const Color.fromARGB(
                                                38, 255, 255, 255),
                                            child: InkWell(
                                              onTap: () {},
                                              child: const SizedBox(
                                                width: 166,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 8, 0, 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                          Icons
                                                              .history_outlined,
                                                          color: Colors.white),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        'History',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 15, 10, 10),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Material(
                                          color: Colors.white,
                                          child: InkWell(
                                            onTap: () {},
                                            child: SizedBox(
                                                width: 595,
                                                height: 70,
                                                child: Center(
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                0, 8, 0, 8),
                                                        child:
                                                            SfBarcodeGenerator(
                                                          value:
                                                              _userBarcodeValue,
                                                          showValue: false,
                                                          barColor:
                                                              Colors.black,
                                                        )))),
                                          ))))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
