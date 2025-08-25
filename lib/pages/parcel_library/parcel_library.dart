import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/ui_components/filled_mdx_button.dart';

class ParcelLibraryPage extends StatefulWidget {
  const ParcelLibraryPage({super.key});

  @override
  State<ParcelLibraryPage> createState() => _ParcelLibraryPageState();
}

class _ParcelLibraryPageState extends State<ParcelLibraryPage> {
  int _value = 0;

  final List<String> _chipLabels = [
    "All",
    "Delivered",
    "On Delivery",
    "Sorted"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Parcel'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(_chipLabels.length, (int index) {
                return ChoiceChip(
                  label: Text(_chipLabels[index]),
                  showCheckmark: false,
                  selected: _value == index,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : _value;
                    });
                  },
                );
              }),
            ),
          ),
          Expanded(
            child: Center(
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
                              "No parcel available",
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
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text("Parcel Library"),
                                            content: const Text(
                                              "This feature only available in mobile version "
                                              "To use full feature for My Parcel, you are required/recommended to put your Unique ID "
                                              "(available in Reward page and Profile Page) at the start of your address on your parcel.\n\n"
                                              "This allows the system to automatically detect and display your parcel here.",
                                            ),
                                            actions: [
                                              TextButton(
                                                child: const Text("Close"),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    text: "Learn more",
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
          )
        ]));
  }
}
