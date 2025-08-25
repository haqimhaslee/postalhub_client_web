import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/services/locations/locations_all.dart';
import 'package:postalhub_tracker/pages/services/locations/locations_smartlocker.dart';

class LocationsMain extends StatelessWidget {
  const LocationsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: "Map viewer",
          child: const Icon(Icons.map_outlined),
        ),
        appBar: AppBar(
          title: const Text('Locations'),
          bottom: TabBar(
            dividerHeight: 0,
            splashBorderRadius: BorderRadius.circular(15),
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Hub'),
              Tab(text: 'Smart Locker'),
            ],
          ),
        ),
        body: const ClipRRect(
          child: TabBarView(
            children: [LocationsAll(), LocationsAll(), LocationsSmartlocker()],
          ),
        ),
      ),
    );
  }
}
