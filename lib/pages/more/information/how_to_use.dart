import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HowToUse extends StatefulWidget {
  const HowToUse({super.key});

  @override
  State<HowToUse> createState() => _HowToUseState();
}

// ignore: unused_element
Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

class _HowToUseState extends State<HowToUse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      const SliverAppBar.large(
        title: Text('How to use'),
      ),
      SliverToBoxAdapter(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ExpansionTile(
                    initiallyExpanded: true,
                    title: const Text(
                      'Track your parcel',
                      style: TextStyle(fontSize: 19.0),
                    ),
                    children: <Widget>[
                      const Text(
                        'Enter your tracking number in the Tracking Number field*',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const Text(
                        '(*Case sensitive)',
                        style: TextStyle(fontSize: 10.0),
                      ),
                      const SizedBox(height: 10.0),
                      Card(
                        elevation: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            width: 400,
                            'assets/images/How_to_use_1.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        "Click 'Search' and this site will search your parcel information in our database",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 10.0),
                      Card(
                        elevation: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            width: 400,
                            'assets/images/How_to_use_2.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text(
                      "Interact with 'Ask AI'",
                      style: TextStyle(fontSize: 19.0),
                    ),
                    children: <Widget>[
                      Text(
                        "With 'Ask AI', you can ask nearly any question—from general queries to questions regarding Postal Hub.¹",
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text(
                      'Parcel Library, Parcel Arrived Notification, Reward Points and more²',
                      style: TextStyle(fontSize: 19.0),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'More features are available in mobile app.',
                        ),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text(
                      'Bringing the latest/exciting technology',
                      style: TextStyle(fontSize: 19.0),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Our team is dedicated to bringing you cutting-edge technology to enhance your shipping and tracking experience.',
                        ),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text(
                      'The beginning of a multi-year project',
                      style: TextStyle(fontSize: 19.0),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'We are committed to expanding and improving this system over the coming years to provide even more features and reliability.',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "¹ Powered by Gemini 1.5 Flash. There is no chat or interaction history saved by this AI model. The AI model, which was trained on a dataset that contains general data knowledge up to mid 2023 and is continuously updated, to learn and process information using Google's core algorithms.",
                  style: TextStyle(fontSize: 10.0),
                ),
                Text(
                  "² Account registration required. Few features planned and still on development. Coming soon in Google Play Store and Apple App Store.",
                  style: TextStyle(fontSize: 10.0),
                ),
                Text(
                  "System UI may different as few improvement has been added over time, update to the latest version by refreshing this app/website a few times.",
                  style: TextStyle(fontSize: 10.0),
                ),
              ],
            ))
      ]))
    ]));
  }
}
