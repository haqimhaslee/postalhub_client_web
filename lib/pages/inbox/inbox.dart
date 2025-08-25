import 'package:flutter/material.dart';

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
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inbox"),
          bottom: TabBar(
            dividerHeight: 0.5,
            tabs: [
              Tab(text: 'Notifications'),
              Tab(text: 'Support'),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Center(child: Text('Coming Soon!')),
            Center(child: Text('Coming Soon!')),
          ],
        ),
      ),
    );
  }
}
