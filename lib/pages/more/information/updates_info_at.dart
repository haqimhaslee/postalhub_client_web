import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:shimmer/shimmer.dart';

class UpdatesInfoAt extends StatefulWidget {
  const UpdatesInfoAt({super.key});

  @override
  State<UpdatesInfoAt> createState() => _UpdatesInfoAtState();
}

class _UpdatesInfoAtState extends State<UpdatesInfoAt> {
  final int _limit = 5;
  final List<DocumentSnapshot> _updates = [];
  bool _isLoading = false;
  bool _hasMore = true;
  DocumentSnapshot? _lastDocument;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchUpdates();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchUpdates();
      }
    });
  }

  Future<void> _fetchUpdates() async {
    if (_isLoading || !_hasMore) return;
    setState(() => _isLoading = true);

    Query query = FirebaseFirestore.instance
        .collection('version_update_info')
        .orderBy('ver_date', descending: true)
        .limit(_limit);

    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
    }

    QuerySnapshot querySnapshot = await query.get();
    if (querySnapshot.docs.isNotEmpty) {
      _lastDocument = querySnapshot.docs.last;
      setState(() {
        _updates.addAll(querySnapshot.docs);
        _hasMore = querySnapshot.docs.length == _limit;
      });
    } else {
      setState(() => _hasMore = false);
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Release Updates')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _updates.length + 1,
        itemBuilder: (context, index) {
          if (index == _updates.length) {
            return _isLoading
                ? Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 650,
                        ),
                        child: Shimmer.fromColors(
                          direction: ShimmerDirection.ltr,
                          period: const Duration(milliseconds: 600),
                          baseColor: Theme.of(context)
                              .colorScheme
                              .surfaceContainerLowest,
                          highlightColor: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                          child: const Card(
                              elevation: 0,
                              child: SizedBox(
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                ),
                              )),
                        )))
                : const SizedBox();
          }
          Map<String, dynamic> data =
              _updates[index].data() as Map<String, dynamic>;
          Timestamp timestamp = data['ver_date'];
          DateTime dateTime = timestamp.toDate();
          String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);

          return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 650,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          formattedDate,
                        ),
                        subtitle: MarkdownBlock(
                          data: data['ver_info']?.replaceAll(r'\n', '\n') ??
                              'No Content',
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Divider())
                    ],
                  )));
        },
      ),
    );
  }
}
