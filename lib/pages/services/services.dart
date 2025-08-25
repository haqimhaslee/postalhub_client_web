// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/newsletter/main_newsletter.dart';
import 'dart:math';

import 'package:postalhub_tracker/pages/services/locations/locations_main.dart';
import 'package:postalhub_tracker/pages/parcel_library/parcel_library.dart';
import 'package:postalhub_tracker/pages/search_inventory/search_inventory.dart';
import 'package:postalhub_tracker/pages/services/customer_services/customer_services.dart';
import 'package:postalhub_tracker/pages/services/reward_system/reward_system_main.dart';
import 'package:postalhub_tracker/pages/services/smart_locker/smart_locker_main.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});
  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        //appBar: AppBar(
        //   title: const Text('Services'),
        //),
        body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 750,
                ),
                child: ListView(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 13),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                      ),
                                      child: Text(
                                        "Postal Hub",
                                        style: TextStyle(
                                          fontSize: 23,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      size: 25,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ],
                                ),
                              ),
                              Wrap(
                                runSpacing: 15,
                                spacing: 15,
                                alignment: WrapAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Material(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceVariant,
                                        child: InkWell(
                                          //splashColor: Theme.of(context).colorScheme.tertiary,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SearchInventory()));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 45,
                                                  child: Icon(
                                                    Icons.search_rounded,
                                                    size: 35,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Find Parcel",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Material(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceVariant,
                                        child: InkWell(
                                          //splashColor: Theme.of(context).colorScheme.tertiary,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ParcelLibraryPage()));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 45,
                                                  child: Icon(
                                                    Icons.inventory_2_outlined,
                                                    size: 35,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "My Parcel",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Material(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceVariant,
                                        child: InkWell(
                                          //splashColor: Theme.of(context).colorScheme.tertiary,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SmartLockerMain()));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 45,
                                                  child: Icon(
                                                    Icons.kitchen_outlined,
                                                    size: 35,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Smart Locker",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Material(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceVariant,
                                        child: InkWell(
                                          //splashColor: Theme.of(context).colorScheme.tertiary,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AnnouncementNewsPage()));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 45,
                                                  child: Icon(
                                                    Icons.newspaper_outlined,
                                                    size: 35,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Newletter",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Material(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceVariant,
                                        child: InkWell(
                                          //splashColor: Theme.of(context).colorScheme.tertiary,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LocationsMain()));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 45,
                                                  child: Icon(
                                                    Icons.warehouse_outlined,
                                                    size: 35,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Locations",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    bottom: 15, top: 15, left: 20, right: 20),
                                child: Divider(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 13),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                      ),
                                      child: Text(
                                        "More Services",
                                        style: TextStyle(
                                          fontSize: 23,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      size: 25,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ],
                                ),
                              ),
                              Wrap(
                                runSpacing: 15,
                                spacing: 15,
                                alignment: WrapAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Material(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceVariant,
                                        child: InkWell(
                                          //splashColor: Theme.of(context).colorScheme.tertiary,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RewardSystemMain()));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 45,
                                                  child: Icon(
                                                    Icons.redeem_outlined,
                                                    size: 35,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Rewards",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Material(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceVariant,
                                        child: InkWell(
                                          //splashColor: Theme.of(context).colorScheme.tertiary,
                                          onTap: () {},
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 45,
                                                  child: Icon(
                                                    Icons.store_outlined,
                                                    size: 35,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Marketplace",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    bottom: 15, top: 15, left: 20, right: 20),
                                child: Divider(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 13),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                      ),
                                      child: Text(
                                        "Utilities",
                                        style: TextStyle(
                                          fontSize: 23,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      size: 25,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ],
                                ),
                              ),
                              Wrap(
                                runSpacing: 15,
                                spacing: 15,
                                alignment: WrapAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Material(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceVariant,
                                        child: InkWell(
                                          //splashColor: Theme.of(context).colorScheme.tertiary,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CustomerServices()));
                                          },
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              ClipRRect(
                                                child: SizedBox(
                                                  width: 40,
                                                  height: 45,
                                                  child: Icon(
                                                    Icons.feedback_outlined,
                                                    size: 35,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSurfaceVariant,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Customer Services",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSurface,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AnimatedBuilder(
                                    animation: _animationController,
                                    builder: (context, child) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          shape: BoxShape.rectangle,
                                          gradient: SweepGradient(
                                            colors: const [
                                              Colors.blue,
                                              Colors.red,
                                              Colors.blue,
                                            ],
                                            stops: const [0.0, 0.5, 1.0],
                                            transform: GradientRotation(
                                                _animationController.value *
                                                    2 *
                                                    pi),
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(
                                            2.5), // Border thickness
                                        child: SizedBox(
                                          width: 95,
                                          height: 95,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Material(
                                              //color: Theme.of(context).colorScheme.secondaryContainer,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "More Services Coming Soon",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onBackground,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          )),
                    )
                  ],
                ))));
  }
}
