import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class MainFaqsPage extends StatefulWidget {
  const MainFaqsPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MainFaqsPageState createState() => _MainFaqsPageState();
}

class _MainFaqsPageState extends State<MainFaqsPage> {
  List<DocumentSnapshot> documents = [];
  bool isLoading = false;
  bool hasMore = true;
  DocumentSnapshot? lastDocument;
  final int limit = 5;
  final ScrollController _scrollController = ScrollController();
  DocumentSnapshot? selectedDocument;

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
        .collection('faq')
        .orderBy('faqViews', descending: true)
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
      appBar: AppBar(title: const Text("FAQs")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLargeScreen = constraints.maxWidth >= 900;

          return Row(
            children: [
              Expanded(
                flex: 2,
                child: buildListView(isLargeScreen),
              ),
              if (isLargeScreen) const VerticalDivider(width: 1, thickness: 1),
              if (isLargeScreen)
                Expanded(
                  flex: 3,
                  child: selectedDocument != null
                      ? FaqDetailPage(
                          title: selectedDocument!['faqTitle'],
                          description: selectedDocument!['faqContent'],
                          date: DateFormat('d/M/yyyy').format(
                              (selectedDocument!['faqDatePublished']
                                      as Timestamp)
                                  .toDate()),
                        )
                      : const Center(child: Text("Select a queries")),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget buildListView(bool isLargeScreen) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 550),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: documents.length + (hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == documents.length) {
              return shimmerPlaceholder();
            }

            final doc = documents[index];
            final DateTime date =
                (doc['faqDatePublished'] as Timestamp).toDate();
            final String formattedDate = DateFormat('d/M/yyyy').format(date);

            // Decide corner radius based on position
            BorderRadius borderRadius;
            if (index == 0) {
              // Top item
              borderRadius = const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(3),
              );
            } else if (index == documents.length - 1) {
              // Bottom item
              borderRadius = const BorderRadius.only(
                topLeft: Radius.circular(3),
                topRight: Radius.circular(3),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              );
            } else {
              // Middle items
              borderRadius = const BorderRadius.all(Radius.circular(3));
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 3),
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    child: Material(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceVariant
                          .withOpacity(0.7),
                      child: InkWell(
                        onTap: () {
                          if (isLargeScreen) {
                            setState(() => selectedDocument = doc);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FaqDetailPage(
                                  title: doc['faqTitle'],
                                  description: doc['faqContent'],
                                  date: formattedDate,
                                ),
                              ),
                            );
                          }
                        },
                        child: ListTile(
                          trailing: const Icon(Icons.chevron_right_rounded),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  doc['faqTitle'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget shimmerPlaceholder() {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 1500),
      baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Card(
        elevation: 0,
        child: SizedBox(
          height: 90,
          child: Expanded(
              child: Row(
            children: [],
          )),
        ),
      ),
    );
  }
}

class FaqDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  const FaqDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          children: [
            const SizedBox(height: 10.0),
            Padding(
                padding: const EdgeInsets.only(
                    left: 10, bottom: 0, right: 10, top: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3),
                    ),
                    child: Material(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month_rounded,
                                      size: 14),
                                  const SizedBox(width: 4),
                                  Text("Updated on $date",
                                      style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w100)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
            Padding(
                padding: const EdgeInsets.only(
                    left: 10, bottom: 10, right: 10, top: 3),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(3),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    child: Material(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 20, right: 20, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MarkdownBlock(
                                data: description,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))),
            const SizedBox(height: 3),
          ],
        ),
      ),
    ));
  }
}
