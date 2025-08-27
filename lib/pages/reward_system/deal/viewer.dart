import 'package:flutter/material.dart';
import 'package:markdown_widget/widget/markdown_block.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/redeem_page.dart';
import 'package:postalhub_tracker/src/ui_components/filled_mdx_button.dart';

class DealViewer extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final int rewardPointValue;
  final String provider;
  final bool rewardLimited;
  final int rewardStock;

  const DealViewer({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rewardPointValue,
    required this.provider,
    required this.rewardLimited,
    required this.rewardStock,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        bottomNavigationBar: SizedBox(
          width: 100,
          child: BottomAppBar(
              child: Padding(
            padding: const EdgeInsets.only(left: 0, bottom: 0, right: 0),
            child: FilledMdxButton(
              onPressed: (rewardLimited && rewardStock == 0)
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RedeemPage(
                            imgurl: imageUrl,
                            title: title,
                            description: description,
                            rewardPointValue: rewardPointValue,
                          ),
                        ),
                      );
                    },
              text: "REDEEM",
              color: Theme.of(context).colorScheme.primary,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              enabled: !(rewardLimited && rewardStock == 0),
            ),
          )),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550),
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: [
                ClipRRect(
                  child: Image.network(imageUrl),
                ),
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
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Text("by $provider",
                                          style: const TextStyle(fontSize: 15)),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text(
                                            rewardPointValue.toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            " points",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                          if (rewardLimited == true)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  child: Material(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primaryContainer,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                5, 2, 5, 2),
                                                        child: Text(
                                                          "LIMITED",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onPrimaryContainer,
                                                          ),
                                                        )),
                                                  )),
                                            ),
                                          if (rewardLimited && rewardStock == 0)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  child: Material(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .error,
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                5, 2, 5, 2),
                                                        child: Text(
                                                          "NOT AVAILABLE",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .onError,
                                                          ),
                                                        )),
                                                  )),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 10, right: 10, top: 0),
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
