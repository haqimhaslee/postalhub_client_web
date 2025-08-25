import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/services/printing/print_job.dart';

class PrintingService extends StatefulWidget {
  const PrintingService({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _PrintingServiceState createState() => _PrintingServiceState();
}

class _PrintingServiceState extends State<PrintingService>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Printing Service"),
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
