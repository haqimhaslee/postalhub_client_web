import 'package:flutter/material.dart';

class PrintJobPage extends StatefulWidget {
  const PrintJobPage({super.key});

  @override
  State<PrintJobPage> createState() => _PrintJobPageState();
}

class _PrintJobPageState extends State<PrintJobPage> {
  int _value = 0;

  final List<String> _chipLabels = ["All", "Completed", "Pending"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                borderRadius: BorderRadius.circular(10),
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
          child: Text("Coming Soon!"),
        ),
      )
    ]));
  }
}
