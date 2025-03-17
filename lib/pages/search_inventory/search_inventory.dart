// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:image_network/image_network.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

class SearchInventory extends StatefulWidget {
  const SearchInventory({super.key});

  @override
  State<SearchInventory> createState() => _SearchInventoryState();
}

final searchInput = TextEditingController();

class _SearchInventoryState extends State<SearchInventory> {
  final _firestore = FirebaseFirestore.instance;
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 90,
/*
          actions: [
            IconButton(
              tooltip: 'Info',
              icon: Icon(
                Icons.info_rounded,
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Leaving soon'),
                      content: const Text(
                          "This page is being moved to a new directory as part of our ongoing system enhancements. Additionally, we’re introducing a new feature accessible from the Navigation Bar/Rail/Drawer. Don’t worry—you’ll still be able to track your parcel on the 'Services' page after this update."),
                      actions: [
                        TextButton(
                          child: const Text('Okie dokie! ✌️'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
          */

          title: Center(
            child: Column(
              children: [
                /*
              Row(
                children: [
                  Text(
                    "Leaving soon (Click ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                  Icon(
                    Icons.info_rounded,
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                  Text(
                    " to learn more)",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                  ),
                ],
              ),

              */
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 600,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 0, right: 0, bottom: 0),
                    child: TextField(
                      controller: searchInput,
                      decoration: InputDecoration(
                          labelText: 'Tracking Number*',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, top: 5, right: 5),
                            child: IconButton(
                              icon: const Icon(Icons.search_rounded),
                              onPressed: () => setState(
                                  () => _searchTerm = searchInput.text),
                            ),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(
              top: 0,
              left: 0,
              right: 0,
              bottom: 8,
            ),
            child: Column(
              children: [
                //const Divider(),
                Expanded(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 650,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: _buildSearchResults(_searchTerm)),
                  ),
                ))
              ],
            )));
  }

  Widget _buildSearchResults(String searchTerm) {
    if (searchTerm.isEmpty) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/components/search_parcel.png",
              scale: 3,
            ),
            Text(
              '*Case sensitive',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: _performSearch(searchTerm),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: const Duration(milliseconds: 1000),
              baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
              highlightColor:
                  Theme.of(context).colorScheme.surfaceContainerHighest,
              child: ListView(
                children: const [
                  Card(
                      elevation: 0,
                      child: SizedBox(
                        child: AspectRatio(
                          aspectRatio: 16 / 5,
                        ),
                      )),
                  Card(
                      elevation: 0,
                      child: SizedBox(
                        child: AspectRatio(
                          aspectRatio: 16 / 5,
                        ),
                      )),
                  Card(
                      elevation: 0,
                      child: SizedBox(
                        child: AspectRatio(
                          aspectRatio: 16 / 5,
                        ),
                      )),
                ],
              ));
        }

        final documents = snapshot.data?.docs ?? [];
        if (documents.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/components/parcel_not_found.png",
                  scale: 3,
                ),
                Text(
                  'Sorry...',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '\nNo items found for that tracking number or\nyour parcel might not be sorted yet.\nPlease check again later.',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final data = documents[index].data();
            final imageUrl = data['imageUrl'];
            final trackingId2 = data['trackingId2']?.toString() ?? '';
            final trackingId3 = data['trackingId3']?.toString() ?? '';
            final trackingId4 = data['trackingId4']?.toString() ?? '';
            final remarks = data['remarks']?.toString() ?? '';
            final status = data['status'];
            final timestampSorted = data['timestamp_arrived_sorted'] != null
                ? (data['timestamp_arrived_sorted'] as Timestamp).toDate()
                : null;
            final timestampDelivered = data['timestamp_delivered'] != null
                ? (data['timestamp_delivered'] as Timestamp).toDate()
                : null;
            final warehouseCode = data['warehouse']?.toString() ?? '';

            List<StepperData> stepperDataDelivered = [
              StepperData(
                  title: StepperText(
                    "Ready to take",
                    textStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: StepperText("Arriving/Sorting"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Icon(Icons.inventory, color: Colors.white),
                  )),
              StepperData(
                  title: StepperText(
                    "On delivery",
                    textStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: StepperText("On delivery"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child:
                        const Icon(Icons.delivery_dining, color: Colors.white),
                  )),
              StepperData(
                  title: StepperText("Delivered",
                      textStyle: const TextStyle(
                        color: Colors.grey,
                      )),
                  subtitle: StepperText("Delivery"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Icon(Icons.check_rounded, color: Colors.white),
                  ))
            ];

            List<StepperData> stepperDataSorted = [
              StepperData(
                  title: StepperText(
                    "Ready to take",
                    textStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: StepperText("Arriving/Sorting"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Icon(Icons.inventory, color: Colors.white),
                  )),
              StepperData(
                  title: StepperText(
                    "On delivery",
                    textStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: StepperText("On delivery"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child:
                        const Icon(Icons.delivery_dining, color: Colors.white),
                  )),
              StepperData(
                  title: StepperText("Delivered",
                      textStyle: const TextStyle(
                        color: Colors.grey,
                      )),
                  subtitle: StepperText("Delivery"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Icon(Icons.check_rounded, color: Colors.white),
                  ))
            ];

            List<StepperData> stepperDataOnDelivery = [
              StepperData(
                  title: StepperText(
                    "Ready to take",
                    textStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: StepperText("Arriving/Sorting"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Icon(Icons.inventory, color: Colors.white),
                  )),
              StepperData(
                  title: StepperText(
                    "On delivery",
                    textStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  subtitle: StepperText("On delivery"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child:
                        const Icon(Icons.delivery_dining, color: Colors.white),
                  )),
              StepperData(
                  title: StepperText("Not delivered",
                      textStyle: const TextStyle(
                        color: Colors.grey,
                      )),
                  subtitle: StepperText("Delivery"),
                  iconWidget: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: const Icon(Icons.check_rounded, color: Colors.white),
                  ))
            ];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Card(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          left: 25,
                          right: 25,
                          bottom: 15,
                        ),
                        child: switch (status) {
                          1 => AnotherStepper(
                              stepperList: stepperDataSorted,
                              stepperDirection: Axis.horizontal,
                              iconWidth: 40,
                              iconHeight: 40,
                              activeBarColor: Colors.green,
                              inActiveBarColor: Colors.grey,
                              inverted: true,
                              verticalGap: 20,
                              activeIndex: 0,
                              barThickness: 8,
                            ),
                          2 => AnotherStepper(
                              stepperList: stepperDataOnDelivery,
                              stepperDirection: Axis.horizontal,
                              iconWidth: 40,
                              iconHeight: 40,
                              activeBarColor: Colors.green,
                              inActiveBarColor: Colors.grey,
                              inverted: true,
                              verticalGap: 20,
                              activeIndex: 1,
                              barThickness: 8,
                            ),
                          3 => AnotherStepper(
                              stepperList: stepperDataDelivered,
                              stepperDirection: Axis.horizontal,
                              iconWidth: 40,
                              iconHeight: 40,
                              activeBarColor: Colors.green,
                              inActiveBarColor: Colors.grey,
                              inverted: true,
                              verticalGap: 20,
                              activeIndex: 2,
                              barThickness: 8,
                            ),
                          _ => Container(), // Handle default case if needed
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 0,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: ImageNetwork(
                                    image: imageUrl,
                                    height: 350,
                                    width: 300,
                                    onLoading: const CircularProgressIndicator(
                                      color: Colors.indigoAccent,
                                    ),
                                    onError: const Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  )),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: SizedBox(
                        height: 60,
                        width: 400,
                        child: SfBarcodeGenerator(
                          value: '${data['trackingId1']}',
                          showValue: true,
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (trackingId2.isNotEmpty)
                              Row(
                                children: [
                                  const Icon(
                                    Icons.qr_code_scanner_rounded,
                                    size: 15,
                                  ),
                                  Text(
                                    '   Tracking ID 2 :  ${data['trackingId2']}',
                                  ),
                                ],
                              ),
                            if (trackingId3.isNotEmpty)
                              Row(
                                children: [
                                  const Icon(
                                    Icons.qr_code_scanner_rounded,
                                    size: 15,
                                  ),
                                  Text(
                                    '   Tracking ID 3 :  ${data['trackingId3']}',
                                  ),
                                ],
                              ),
                            if (trackingId4.isNotEmpty)
                              Row(
                                children: [
                                  const Icon(
                                    Icons.qr_code_scanner_rounded,
                                    size: 15,
                                  ),
                                  Text(
                                    '   Tracking ID 4 :  ${data['trackingId4']}',
                                  ),
                                ],
                              ),
                            if (remarks.isNotEmpty)
                              Row(
                                children: [
                                  const Icon(
                                    Icons.description_rounded,
                                    size: 15,
                                  ),
                                  Text(
                                    '    Remarks :  $remarks',
                                  ),
                                ],
                              ),
                            if (timestampSorted != null)
                              Row(
                                children: [
                                  const Icon(
                                    Icons.schedule_rounded,
                                    size: 15,
                                  ),
                                  Text(
                                    '   Sorted at :  ${DateFormat.yMMMd().add_jm().format(timestampSorted)}',
                                  ),
                                ],
                              ),
                            if (warehouseCode.isNotEmpty)
                              Row(
                                children: [
                                  const Icon(
                                    Icons.warehouse_rounded,
                                    size: 15,
                                  ),
                                  Text(
                                    '   Warehouse/Branch :  $warehouseCode',
                                  ),
                                ],
                              ),
                            if (timestampDelivered != null)
                              Row(
                                children: [
                                  const Icon(
                                    Icons.schedule_rounded,
                                    size: 15,
                                  ),
                                  Text(
                                    '   Delivered at :  ${DateFormat.yMMMd().add_jm().format(timestampDelivered)}',
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _performSearch(
      String searchTerm) async {
    return _firestore
        .collection('parcelInventory')
        .where('trackingId1', isEqualTo: searchTerm)
        .get()
        .then((result1) {
      if (result1.docs.isNotEmpty) {
        return result1; // Return if found in trackingId1
      }

      // If not found in trackingId1, check trackingId2
      return _firestore
          .collection('parcelInventory')
          .where('trackingId2', isEqualTo: searchTerm)
          .get()
          .then((result2) {
        if (result2.docs.isNotEmpty) {
          return result2; // Return if found in trackingId2
        }

        // If not found in trackingId2, check trackingId3
        return _firestore
            .collection('parcelInventory')
            .where('trackingId3', isEqualTo: searchTerm)
            .get()
            .then((result3) {
          if (result3.docs.isNotEmpty) {
            return result3; // Return if found in trackingId3
          }

          // Finally, check trackingId4
          return _firestore
              .collection('parcelInventory')
              .where('trackingId4', isEqualTo: searchTerm)
              .get();
        });
      });
    });
  }
}
