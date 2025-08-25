import 'package:flutter/material.dart';

class NotAvailWeb extends StatefulWidget {
  const NotAvailWeb({super.key});
  @override
  State<NotAvailWeb> createState() => _NotAvailWebState();
}

class _NotAvailWebState extends State<NotAvailWeb> {
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
            "assets/images/components/not_available.png",
            scale: 3,
          ),
          Text(
            'This feature is not available on the web version\nPlease use the mobile app',
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
