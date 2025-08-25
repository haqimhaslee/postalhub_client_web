import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/services/printing/print_job.dart';

class ThreedPrinting extends StatefulWidget {
  const ThreedPrinting({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ThreedPrintingState createState() => _ThreedPrintingState();
}

class _ThreedPrintingState extends State<ThreedPrinting>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("3D Printing Service"),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Print Jobs', icon: Icon(Icons.print_rounded)),
              Tab(text: 'Printer Location', icon: Icon(Icons.location_on)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          onPressed: () {},
          icon: const Icon(Icons.add_rounded),
          label: const Text('New print job'),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            PrintJobPage(),
            Center(child: Text('Coming Soon!')),
          ],
        ),
      ),
    );
  }
}
