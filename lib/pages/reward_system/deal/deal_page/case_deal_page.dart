import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/viewer.dart';
import 'package:shimmer/shimmer.dart';

class CaseDealPage extends StatefulWidget {
  final dynamic caseData;
  const CaseDealPage({
    super.key,
    required this.caseData,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CaseDealPageState createState() => _CaseDealPageState();
}

class _CaseDealPageState extends State<CaseDealPage> {
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

    var caseData = widget.caseData;
    Query query = FirebaseFirestore.instance
        .collection('rewardLibrary')
        .where('rewardTag', isEqualTo: caseData)
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

  String selectedOption = 'recommended';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Case Deal Page")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sort by",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 2, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          child: Material(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: RadioListTile<String>(
                                  title: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                    child: const Text('Recommended'),
                                  ),
                                  value: 'recommended',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 2, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                          child: Material(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: RadioListTile<String>(
                                  title: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                    child: const Text('Points : Ascending'),
                                  ),
                                  value: 'ascending',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                ),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 2, right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          child: Material(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: RadioListTile<String>(
                                  title: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                    child: const Text('Points : Descending'),
                                  ),
                                  value: 'descending',
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                );
              },
            );
          },
          label: const Text("Sort"),
          icon: const Icon(Icons.sort_rounded),
        ),
        body: Center(
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: documents.length + (hasMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == documents.length) {
                      return shimmerPlaceholder();
                    }

                    final doc = documents[index];

                    return Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Material(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DealViewer(
                                                rewardLimited:
                                                    doc['rewardLimited'],
                                                rewardStock: doc['rewardStock'],
                                                title: doc['rewardTitle'],
                                                description:
                                                    doc['rewardDescription'],
                                                imageUrl: doc['rewardImage'],
                                                provider: doc['rewardProvider'],
                                                rewardPointValue:
                                                    doc['rewardPointValue'],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(25),
                                                        topRight:
                                                            Radius.circular(
                                                                25)),
                                                child: SizedBox(
                                                  width: 500,
                                                  height: 200,
                                                  child: Image.network(
                                                      doc['rewardImage'],
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        doc['rewardTitle'],
                                                        style: const TextStyle(
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        softWrap: true,
                                                      ),
                                                      const SizedBox(height: 3),
                                                      Text(
                                                        doc['rewardProvider'],
                                                        style: const TextStyle(
                                                          fontSize: 14.5,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 15),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            (doc['rewardPointValue'] ??
                                                                    0)
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          ),
                                                          Text(
                                                            " points ",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          if (doc['rewardLimited'] ==
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 0.0),
                                                              child: ClipRRect(
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .all(
                                                                          Radius.circular(
                                                                              5)),
                                                                  child:
                                                                      Material(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .colorScheme
                                                                        .primaryContainer,
                                                                    child: Padding(
                                                                        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                                                                        child: Text(
                                                                          "LIMITED",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Theme.of(context).colorScheme.onPrimaryContainer,
                                                                          ),
                                                                        )),
                                                                  )),
                                                            ),
                                                        ],
                                                      )
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ))))),
                      ],
                    );
                  },
                ))));
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
          child: AspectRatio(aspectRatio: 16 / 9),
        ),
      ),
    );
  }
}
