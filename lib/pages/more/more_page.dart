// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/more/about/about_main.dart';
import 'package:postalhub_tracker/pages/more/settings/appearance/appearance_main.dart';
import 'package:postalhub_tracker/pages/more/settings/language/language_main.dart';
import 'package:postalhub_tracker/pages/services/customer_services/customer_services.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});
  @override
  State<MorePage> createState() => _MorePageState();
}

bool switchValue = false;

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile & more"),
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
                          padding: const EdgeInsets.only(top: 20),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 2, right: 15),
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
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
                                left: 15, bottom: 2, right: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
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
                          const EdgeInsets.only(left: 15, bottom: 2, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
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
                          const EdgeInsets.only(left: 15, bottom: 2, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
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
                          const EdgeInsets.only(left: 15, bottom: 2, right: 15),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
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
                          const EdgeInsets.only(left: 15, bottom: 2, right: 15),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
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
