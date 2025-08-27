import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/newsletter/main_newsletter.dart';
import 'package:postalhub_tracker/src/ui_components/filled_mdx_button.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inbox"),
          bottom: TabBar(
            dividerHeight: 0.5,
            tabs: [
              Tab(text: 'Bulletin'),
              Tab(text: 'Notifications'),
              Tab(text: 'Support'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            AnnouncementNewsPage(),
            Center(
                child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Material(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: InkWell(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: double.infinity,
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/components/not_available.png",
                            scale: 4,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "This feature not available on web",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(0)),
                              child: SizedBox(
                                  width: 150,
                                  height: 55,
                                  child: FilledMdxButton(
                                    onPressed: () {},
                                    text: "Okie",
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
            Center(
                child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Material(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: InkWell(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: double.infinity,
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/components/not_available.png",
                            scale: 4,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "This feature not available on web",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(0)),
                              child: SizedBox(
                                  width: 150,
                                  height: 55,
                                  child: FilledMdxButton(
                                    onPressed: () {},
                                    text: "Okie",
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  )))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
