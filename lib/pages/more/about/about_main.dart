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
      Uri.parse(
          'https://www.termsfeed.com/live/9187d68f-f1e8-4d89-921f-f8432437ba97'),
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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('About'),
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
                    children: [
                      ListTile(
                        title: const Text('About'),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const About(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        title: const Text('Terms and Privacy Policy'),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () => _privacypolicy(context),
                      ),
                      ListTile(
                        trailing: const Icon(Icons.chevron_right_rounded),
                        title: const Text('Licences'),
                        onTap: () => showLicensePage(
                          context: context,
                        ),
                      ),
                      ListTile(
                        title: const Text('Version'),
                        trailing: const Text('25.3.2575-web'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UpdatesInfoAt(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 70),
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
