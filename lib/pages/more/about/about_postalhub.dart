import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  int totalParcels = 0;
  int totalParcelDelivered = 0;
  int totalParcelOnDelivery = 0;
  int totalParcelSorted = 0;

  @override
  void initState() {
    super.initState();
    fetchParcelCount();
  }

  Future<void> fetchParcelCount() async {
    try {
      //all
      final queryAll = FirebaseFirestore.instance.collection('parcelInventory');
      final aggregateQueryAll = await queryAll.count().get();
      //delivered
      final queryDelivered = FirebaseFirestore.instance
          .collection('parcelInventory')
          .where('status', isEqualTo: 3);
      final aggregateQueryDelivered = await queryDelivered.count().get();
      //sorted
      final querySorted = FirebaseFirestore.instance
          .collection('parcelInventory')
          .where('status', isEqualTo: 1);
      final aggregateQuerySorted = await querySorted.count().get();
      //ondelivery
      final queryOnDelivery = FirebaseFirestore.instance
          .collection('parcelInventory')
          .where('status', isEqualTo: 2);
      final aggregateQueryOnDelivery = await queryOnDelivery.count().get();
      setState(() {
        totalParcels = aggregateQueryAll.count!;
        totalParcelDelivered = aggregateQueryDelivered.count!;
        totalParcelSorted = aggregateQuerySorted.count!;
        totalParcelOnDelivery = aggregateQueryOnDelivery.count!;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error getting document count: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      const SliverAppBar.large(
        title: Text('About'),
      ),
      SliverToBoxAdapter(
          child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 700,
                  ),
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, bottom: 0, top: 15),
                          child: Text(
                            "Postal Hub",
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 15, bottom: 0, top: 15),
                          child: Text(
                            "Postal Hub is a comprehensive postal service offering a range of shipping options, tracking capabilities, and account management tools inside campus or office area.  We provide convenient online and mobile app access for customers to manage their shipments, track packages, and access account information.  We also maintain a variety of physical locations with counter service.  Visit our website or app for detailed information on services, policies, and locations.",
                            style: TextStyle(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, bottom: 0, top: 15),
                          child: Text(
                            "Our statsistics",
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              _buildAnalyticsCard(
                                context,
                                totalParcels,
                                "Parcel registered",
                              ),
                              _buildAnalyticsCard(context, totalParcelSorted,
                                  "Parcel in werehouse"),
                              _buildAnalyticsCard(
                                  context,
                                  totalParcelOnDelivery,
                                  "On Delivery\n(Coming Soon)"),
                              _buildAnalyticsCard(
                                  context, totalParcelDelivered, "Delivered"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const SizedBox(height: 15.0),
                      ])))))
    ]));
  }

  Widget _buildAnalyticsCard(BuildContext context, int value, String label) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: SizedBox(
        width: 150,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            color: Theme.of(context).colorScheme.surfaceContainerHigh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TweenAnimationBuilder<int>(
                  tween: IntTween(begin: 0, end: value),
                  duration: const Duration(seconds: 1),
                  builder: (context, animatedValue, _) => Text(
                    "$animatedValue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
