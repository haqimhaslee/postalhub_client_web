import 'package:flutter/material.dart';

class SmartLockerMain extends StatefulWidget {
  const SmartLockerMain({super.key});
  @override
  State<SmartLockerMain> createState() => _SmartLockerMainState();
}

class _SmartLockerMainState extends State<SmartLockerMain> {
  @override
  Widget build(BuildContext context) {
    // ... other widget code

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Smart locker'),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\nComing soon [Planned]',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Smart Locker\n',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Image.asset(
                                "assets/images/components/smart_locker_comingsoon.png",
                                scale: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          '\nFully computerised self-service lockers suitable for offices, commercial buildings, shopping malls, theme parks, transportation hub and more.\n\n• New process & effciency\n• Improved flexibility and usage\n• Greater security and governance\n• End-to-end user visibility and management\n• 24hr access with different security options\n• Reporting and accountability tracking\n\n',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Image.asset(
                                "assets/images/components/smart_locker_comingsoon1.png",
                                scale: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "\nHere some exciting news about an upcoming innovation that will significantly enhance our infrastructure.\n\nWe prioritised the importance of secure and efficient storage and retrieval, and we're committed to providing you with the best possible solutions. That's why we've embarked on an in-depth research and development process to customize Smart Lockers tailored specifically to our system.\n\n",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
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
