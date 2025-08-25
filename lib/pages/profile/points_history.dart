import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/wip_page/not_available_body.dart';

class PointsHistory extends StatefulWidget {
  const PointsHistory({super.key});
  @override
  State<PointsHistory> createState() => _PointsHistoryState();
}

class _PointsHistoryState extends State<PointsHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Points history'),
        ),
        body: NotAvailableBody());
  }
}
