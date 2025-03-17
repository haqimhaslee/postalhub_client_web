import 'package:flutter/material.dart';

class PaymentHistoryMain extends StatefulWidget {
  const PaymentHistoryMain({super.key});
  @override
  State<PaymentHistoryMain> createState() => _PaymentHistoryMainState();
}

class _PaymentHistoryMainState extends State<PaymentHistoryMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment history'),
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
