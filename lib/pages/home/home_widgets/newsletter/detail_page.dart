import 'package:flutter/material.dart';
import 'package:markdown_widget/widget/markdown_block.dart';

class AnnouncementDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String date;

  const AnnouncementDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550),
            child: ListView(
              children: [
                Image.network(imageUrl),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 2, right: 10, top: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(3),
                              bottomRight: Radius.circular(3),
                            ),
                            child: Material(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 20, right: 20, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(title,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(height: 3),
                                      Text("by Postal Hub",
                                          style: const TextStyle(fontSize: 15)),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const Icon(
                                              Icons.calendar_month_rounded,
                                              size: 13),
                                          const SizedBox(width: 4),
                                          Text(date,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 15, right: 10, top: 0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(3),
                                topRight: Radius.circular(3)),
                            child: Material(
                              color:
                                  Theme.of(context).colorScheme.surfaceVariant,
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10, right: 20, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MarkdownBlock(
                                        data:
                                            description.replaceAll(r'\n', '\n'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
