import 'package:flutter/material.dart';

class LocationsSmartlocker extends StatefulWidget {
  const LocationsSmartlocker({super.key});
  @override
  State<LocationsSmartlocker> createState() => _LocationsSmartlockerState();
}

class _LocationsSmartlockerState extends State<LocationsSmartlocker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
