import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/newsletter/detail_page.dart';
import 'package:postalhub_tracker/src/components/shimmer_loading_animation.dart';

class AnnouncementWidget extends StatefulWidget {
  const AnnouncementWidget({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AnnouncementWidgetState createState() => _AnnouncementWidgetState();
}

class _AnnouncementWidgetState extends State<AnnouncementWidget> {
  List<DocumentSnapshot> documents = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('news_announcement')
        .orderBy('date', descending: true)
        .limit(2)
        .get();
    setState(() {
      documents = querySnapshot.docs;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 0, top: 0),
                child: Text(
                  "Newsletter",
                  style: TextStyle(
                    fontSize: 23,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 25,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Spacer(),
            ],
          ),
        ),
        if (isLoading)
          Padding(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Column(
              children: [
                ShimmerNews(),
                SizedBox(height: 10),
                ShimmerNews(),
              ],
            ),
          ),
        ...documents.map((doc) {
          Timestamp timestamp = doc['date'];
          String formattedDate =
              DateFormat('d/M/yyyy, h:mm a').format(timestamp.toDate());
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  child: Material(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            child: SizedBox(
                              width: 600,
                              height: 200,
                              child: Image.network(doc['img_url'],
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(15, 13, 0, 6),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/postalhub_logo.jpg'),
                                    radius: 8,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text(
                                      'Postal Hub',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 12,
                                      ),
                                      softWrap: true,
                                      //overflow: TextOverflow.ellipsis,
                                      //maxLines: 1,
                                    ),
                                  )
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                            child: Text(
                              doc['title'],
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                              softWrap: true,
                              //overflow: TextOverflow.ellipsis,
                              //maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                            child: Text(
                              formattedDate,
                              style: const TextStyle(
                                fontSize: 11,
                                //fontWeight: FontWeight.w300,
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnnouncementDetailPage(
                              title: doc['title'],
                              description: doc['description'],
                              imageUrl: doc['img_url'],
                              date: formattedDate,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          );
        }),
        const SizedBox(
          height: 3,
        ),
      ],
    );
  }
}
