import 'package:flutter/material.dart';

class RewardSystemMain extends StatefulWidget {
  const RewardSystemMain({super.key});
  @override
  State<RewardSystemMain> createState() => _RewardSystemMainState();
}

class _RewardSystemMainState extends State<RewardSystemMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Rewards'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/components/not_available.png",
                scale: 3,
              ),
              Text(
                'Not available yet',
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
