import 'package:flutter/material.dart';

class WorkInProgressBody extends StatefulWidget {
  const WorkInProgressBody({super.key});
  @override
  State<WorkInProgressBody> createState() => _WorkInProgressBodyState();
}

class _WorkInProgressBodyState extends State<WorkInProgressBody> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/components/work_in_progress.png",
            scale: 3,
          ),
          Text(
            'Work In Progress\nComing Soon',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 13,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ));
  }
}
