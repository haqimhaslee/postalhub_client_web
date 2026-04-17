// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/more/about/about_main.dart';
import 'package:postalhub_tracker/pages/more/settings/appearance/appearance_main.dart';
import 'package:postalhub_tracker/pages/more/settings/language/language_main.dart';
import 'package:postalhub_tracker/pages/services/customer_services/customer_services.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});
  @override
  State<MorePage> createState() => _MorePageState();
}

bool switchValue = false;

class _MorePageState extends State<MorePage> {
  Future<void> _launchURL() async {
    const url =
        'https://play.google.com/store/apps/details?id=com.postalhub.tracker';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("More"),
        ),
        body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 750,
              ),
              child: ListView(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerLow,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.15),
                                      blurRadius: 10,
                                      offset: const Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: -60,
                                        right: -30,
                                        child: Container(
                                          width: 200,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.surfaceContainerHigh,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 35,
                                                            child: const Icon(
                                                              Icons.person,
                                                              size: 40,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 16),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Guest',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20,
                                                                color: Theme.of(
                                                                  context,
                                                                )
                                                                    .colorScheme
                                                                    .onSurface,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 2),
                                                            Text(
                                                              'Download app to access more features',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 15,
                                                                color: const Color(
                                                                    0xFF888888),
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            FilledButton(
                                                              onPressed: () {
                                                                _launchURL();
                                                              },
                                                              child: Text(
                                                                  "Download Now"),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            IconButton.filled(
                                              onPressed: () {},
                                              icon: Icon(
                                                  Icons.qr_code_2_rounded,
                                                  size: 30),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 3, right: 15),
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                                child: Material(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Opps! Not available'),
                                            content: Text(
                                                'This feature only available in mobile version (Account registration required).'),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: ListTile(
                                        title:
                                            const Text('Personal Information'),
                                        subtitle: const Text(
                                            'Manage your personal information'),
                                        leading: const Icon(
                                          Icons.person_rounded,
                                          size: 30,
                                        ),
                                        trailing: const Icon(
                                          Icons.chevron_right_rounded,
                                        ),
                                      ),
                                    ),
                                  ),
                                )))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 3, right: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                              child: Material(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant,
                                child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Opps! Not available'),
                                            content: Text(
                                                'This feature only available in mobile version (Account registration required).'),
                                            actions: [
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.of(context).pop(),
                                                child: Text('OK'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: ListTile(
                                        title: const Text('Points history'),
                                        subtitle:
                                            const Text('Show points history'),
                                        leading: const Icon(
                                          Icons.history_rounded,
                                          size: 25,
                                        ),
                                        trailing: const Icon(
                                            Icons.chevron_right_rounded),
                                      ),
                                    )),
                              ),
                            )),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 3, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AppearanceMain()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: ListTile(
                                  title: const Text('Appearance'),
                                  subtitle: const Text(
                                      'Customize the app appearance'),
                                  leading: const Icon(
                                    Icons.palette_rounded,
                                    size: 25,
                                  ),
                                  trailing:
                                      const Icon(Icons.chevron_right_rounded),
                                ),
                              )),
                        ),
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 3, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LanguageMain()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: ListTile(
                                  title: const Text('Languages'),
                                  subtitle: const Text(
                                      'Customize the app appearance'),
                                  leading: const Icon(
                                    Icons.translate_rounded,
                                    size: 25,
                                  ),
                                  trailing:
                                      const Icon(Icons.chevron_right_rounded),
                                ),
                              )),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 3, right: 15),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          child: Material(
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomerServices()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: ListTile(
                                  title: const Text('Help & Support Center'),
                                  subtitle: const Text('Get help and support'),
                                  leading: const Icon(
                                    Icons.help_rounded,
                                    size: 25,
                                  ),
                                  trailing:
                                      const Icon(Icons.chevron_right_rounded),
                                ),
                              ),
                            ),
                          ))),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 3, right: 15),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          child: Material(
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AboutMain()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: ListTile(
                                  title: const Text('About'),
                                  subtitle:
                                      const Text('Learn more about Postal Hub'),
                                  leading: const Icon(
                                    Icons.info_rounded,
                                    size: 25,
                                  ),
                                  trailing:
                                      const Icon(Icons.chevron_right_rounded),
                                ),
                              ),
                            ),
                          ))),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            )));
  }
}
