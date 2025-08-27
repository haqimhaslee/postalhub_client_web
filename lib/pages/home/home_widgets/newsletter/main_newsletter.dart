import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/newsletter/detail_page.dart';
import 'package:shimmer/shimmer.dart';

class AnnouncementNewsPage extends StatefulWidget {
  const AnnouncementNewsPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AnnouncementNewsPageState createState() => _AnnouncementNewsPageState();
}

class _AnnouncementNewsPageState extends State<AnnouncementNewsPage> {
  List<DocumentSnapshot> documents = [];
  bool isLoading = false;
  bool hasMore = true;
  DocumentSnapshot? lastDocument;
  final int limit = 5;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          hasMore) {
        fetchData();
      }
    });
  }

  Future<void> fetchData() async {
    if (isLoading) return;
    setState(() => isLoading = true);

    Query query = FirebaseFirestore.instance
        .collection('news_announcement')
        .orderBy('date', descending: true)
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument!);
    }

    QuerySnapshot querySnapshot = await query.get();

    if (querySnapshot.docs.isNotEmpty) {
      lastDocument = querySnapshot.docs.last;
      setState(() {
        documents.addAll(querySnapshot.docs);
        hasMore = querySnapshot.docs.length == limit;
      });
    } else {
      setState(() => hasMore = false);
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 550),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: documents.length + (hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == documents.length) {
                return Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  period: const Duration(milliseconds: 1500),
                  baseColor:
                      Theme.of(context).colorScheme.surfaceContainerLowest,
                  highlightColor:
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const Card(
                      elevation: 0,
                      child: SizedBox(
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                        ),
                      )),
                );
              }

              final doc = documents[index];
              final DateTime date = (doc['date'] as Timestamp).toDate();
              final String formattedDate =
                  DateFormat('d/M/yyyy, h:mm a').format(date);

              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                                        padding:
                                            EdgeInsets.fromLTRB(5, 0, 0, 0),
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
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 0, 10),
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
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 0, 15),
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
            },
          ),
        ),
      ),
    );
  }
}
