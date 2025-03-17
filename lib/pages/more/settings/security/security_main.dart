import 'package:flutter/material.dart';

class SecurityMain extends StatefulWidget {
  const SecurityMain({super.key});
  @override
  State<SecurityMain> createState() => _SecurityMainState();
}

bool switchValue = false;

class _SecurityMainState extends State<SecurityMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Security'),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 750,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, bottom: 0, top: 20),
                        child: Text(
                          "Manage your account security preferences.",
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('Enable biometric'),
                        trailing: Switch(
                          value: switchValue,
                          onChanged: (bool newValue) {
                            setState(() {
                              switchValue = switchValue;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Change password'),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
