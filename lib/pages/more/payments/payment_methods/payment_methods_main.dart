import 'package:flutter/material.dart';

class PaymentMethodsMain extends StatefulWidget {
  const PaymentMethodsMain({super.key});
  @override
  State<PaymentMethodsMain> createState() => _PaymentMethodsMainState();
}

class _PaymentMethodsMainState extends State<PaymentMethodsMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment Methods'),
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
