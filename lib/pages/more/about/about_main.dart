import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:postalhub_tracker/pages/more/about/about_postalhub.dart';
import 'package:postalhub_tracker/pages/more/information/updates_info_at.dart';

class AboutMain extends StatefulWidget {
  const AboutMain({super.key});

  @override
  State<AboutMain> createState() => _AboutMainState();
}

Future<void> _privacypolicy(BuildContext context) async {
  final theme = Theme.of(context);
  try {
    await launchUrl(
      Uri.parse('https://policies.postalhub.my'),
      customTabsOptions: CustomTabsOptions(
        colorSchemes: CustomTabsColorSchemes.defaults(
          toolbarColor: theme.colorScheme.surface,
          navigationBarColor: theme.colorScheme.surface,
        ),
        shareState: CustomTabsShareState.off,
        urlBarHidingEnabled: true,
        showTitle: true,
      ),
      safariVCOptions: SafariViewControllerOptions(
        preferredBarTintColor: theme.colorScheme.surface,
        preferredControlTintColor: theme.colorScheme.onSurface,
        barCollapsingEnabled: true,
        entersReaderIfAvailable: false,
      ),
    );
  } catch (e) {
    debugPrint(e.toString());
  }
}

class _AboutMainState extends State<AboutMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 750,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                                      builder: (context) => const About()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: ListTile(
                                title: const Text('About'),
                                subtitle:
                                    const Text('Learn more about Postal Hub'),
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
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                      child: Material(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        child: InkWell(
                            onTap: () => _privacypolicy(context),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: ListTile(
                                title: const Text('Policies'),
                                subtitle: const Text(
                                    'Learn more about our terms and privacy policy'),
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
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                      child: Material(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        child: InkWell(
                            onTap: () => showLicensePage(
                                  context: context,
                                ),
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: ListTile(
                                title: const Text('Licences'),
                                subtitle:
                                    const Text('Licenses used in Postal Hub'),
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
                                  builder: (context) => const UpdatesInfoAt(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: ListTile(
                                title: const Text('Version'),
                                subtitle: const Text('Version of Postal Hub'),
                                trailing:
                                    const Icon(Icons.chevron_right_rounded),
                              ),
                            )),
                      ),
                    )),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
