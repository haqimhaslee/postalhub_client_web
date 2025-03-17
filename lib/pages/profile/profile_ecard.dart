import 'package:flutter/material.dart';

class ProfileEcard extends StatefulWidget {
  const ProfileEcard({super.key});
  @override
  State<ProfileEcard> createState() => _ProfileEcardState();
}

class _ProfileEcardState extends State<ProfileEcard> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Digital Card'),
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
