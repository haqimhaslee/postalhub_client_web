import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/profile/points_history.dart';
import 'package:postalhub_tracker/pages/profile/profile_ecard.dart';
import 'package:postalhub_tracker/pages/services/reward_system/reward_system_main.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class ProfileOverviewWidget extends StatefulWidget {
  const ProfileOverviewWidget({super.key});

  @override
  State<ProfileOverviewWidget> createState() => _ProfileOverviewWidgetState();
}

class _ProfileOverviewWidgetState extends State<ProfileOverviewWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _greeting = "Oh, Hi!";

  @override
  void initState() {
    super.initState();
    _fetchGreeting();
  }

  Future<void> _fetchGreeting() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('user_experience').get();
      if (snapshot.docs.isNotEmpty) {
        var data = snapshot.docs.first.data() as Map<String, dynamic>;
        setState(() {
          _greeting = data['greeting'] ?? 'Oh, Hi!';
        });
      } else {
        setState(() {
          _greeting = 'Oh, Hi!';
        });
      }
    } catch (e) {
      setState(() {
        _greeting = 'Oh, Hi!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
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
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/profile_image_icon.jpg'),
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
                                            _greeting,
                                            style:
                                                const TextStyle(fontSize: 15),
                                          ),
                                          //Text('<first_name> <last_name>'),
                                        ],
                                      ),
                                      Expanded(child: Container()),
                                      const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 10, 0),
                                          child: Icon(Icons.verified_outlined))
                                    ],
                                  )),
                            ],
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
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
                                                    BorderRadius.circular(5),
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
                                    const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '0',
                                              style: TextStyle(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
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
                                              BorderRadius.circular(5),
                                          child: Material(
                                            color: const Color.fromARGB(
                                                38, 255, 255, 255),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const PointsHistory()));
                                              },
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
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Material(
                                            color: const Color.fromARGB(
                                                38, 255, 255, 255),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const RewardSystemMain()));
                                              },
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
                                                          Icons.redeem_outlined,
                                                          color: Colors.white),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        'Redeem',
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
                                      borderRadius: BorderRadius.circular(5),
                                      child: Material(
                                        color: Colors.white,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ProfileEcard()));
                                          },
                                          child: SizedBox(
                                              width: 595,
                                              height: 70,
                                              child: Center(
                                                  child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 8, 0, 8),
                                                child: SfBarcodeGenerator(
                                                  value:
                                                      'https://www.haqimhaslee.my',
                                                  showValue: false,
                                                  barColor: Colors.black,
                                                ),
                                              ))),
                                        ),
                                      )))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
