// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/more/about/about_main.dart';
import 'package:postalhub_tracker/pages/more/payments/payment_history/payment_history_main.dart';
import 'package:postalhub_tracker/pages/more/payments/payment_methods/payment_methods_main.dart';
import 'package:postalhub_tracker/pages/more/settings/appearance/appearance_main.dart';
import 'package:postalhub_tracker/pages/more/settings/language/language_main.dart';
import 'package:postalhub_tracker/pages/more/settings/notification/notification_settings.dart';
import 'package:postalhub_tracker/pages/more/settings/security/security_main.dart';
import 'package:postalhub_tracker/pages/profile/points_history.dart';
import 'package:postalhub_tracker/pages/profile/profile_main.dart';
import 'package:postalhub_tracker/pages/profile/profile_widget.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});
  @override
  State<MorePage> createState() => _MorePageState();
}

bool switchValue = false;

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
        //appBar: AppBar(
        //  title: const Text('More'),
        //),
        body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 750,
              ),
              child: ListView(
                children: [
                  const Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(15, 18, 15, 10),
                          child: ClipRRect(
                            child: SizedBox(
                              width: 600,
                              child: ProfileOverviewWidget(),
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 15),
                    child: Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Personal Information'),
                    leading: const Icon(Icons.person_outline_rounded),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileMain()));
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                    child: Text(
                      "Payments",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Payment methods'),
                    leading: const Icon(Icons.credit_card_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentMethodsMain()));
                    },
                  ),
                  ListTile(
                    title: const Text('Payment history'),
                    leading: const Icon(Icons.history_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentHistoryMain()));
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                    child: Text(
                      "Postal Hub",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Postal point'),
                    leading: const Icon(Icons.local_activity_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Points history'),
                    leading: const Icon(Icons.history_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PointsHistory()));
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Security'),
                    leading: const Icon(Icons.lock_outline_rounded),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecurityMain()));
                    },
                  ),
                  ListTile(
                    title: const Text('Appearance'),
                    leading: const Icon(Icons.palette_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppearanceMain()));
                    },
                  ),
                  ListTile(
                    title: const Text('Languages'),
                    leading: const Icon(Icons.translate_rounded),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LanguageMain()));
                    },
                  ),
                  ListTile(
                    title: const Text('Notifications'),
                    leading: const Icon(Icons.notifications_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NotificationMain()));
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                    child: Text(
                      "Support",
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Get help'),
                    leading: const Icon(Icons.help_outline_rounded),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Send feedback'),
                    leading: const Icon(Icons.feedback_outlined),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('About'),
                    leading: const Icon(Icons.info_outline_rounded),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutMain()));
                    },
                  ),
                  ListTile(
                    title: const Center(
                      child:
                          Text('Log Out', style: TextStyle(color: Colors.red)),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            )));
  }
}
