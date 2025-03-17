import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_all.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_delivered.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_onDelivery.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_sorted.dart';

class ParcelLibraryPage extends StatelessWidget {
  const ParcelLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            dividerHeight: 0,
            splashBorderRadius: BorderRadius.circular(15),
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Sorted'),
              Tab(text: 'On Delivery'),
              Tab(text: 'Delivered'),
            ],
          ),
        ),
        body: const ClipRRect(
          child: TabBarView(
            children: [
              ParcelAll(),
              ParcelSorted(),
              ParcelOndelivery(),
              ParcelDelivered()
            ],
          ),
        ),
      ),
    );
  }
}
