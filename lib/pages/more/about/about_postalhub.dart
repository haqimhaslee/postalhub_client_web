import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      const SliverAppBar.large(
        title: Text('About'),
      ),
      SliverToBoxAdapter(
          child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 700,
                  ),
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, bottom: 0, top: 15),
                          child: Text(
                            "Postal Hub",
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 15, bottom: 0, top: 15),
                          child: Text(
                            "Postal Hub is a comprehensive postal service offering a range of shipping options, tracking capabilities, and account management tools inside campus or office area.  We provide convenient online and mobile app access for customers to manage their shipments, track packages, and access account information.  We also maintain a variety of physical locations with counter service.  Visit our website or app for detailed information on services, policies, and locations.",
                            style: TextStyle(),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const SizedBox(height: 15.0),
                      ])))))
    ]));
  }
}
