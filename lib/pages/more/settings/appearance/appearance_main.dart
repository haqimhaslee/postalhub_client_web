import 'package:flutter/material.dart';
import 'package:postalhub_tracker/main.dart';
// adjust this path

class AppearanceMain extends StatefulWidget {
  const AppearanceMain({super.key});
  @override
  State<AppearanceMain> createState() => _AppearanceMainState();
}

class _AppearanceMainState extends State<AppearanceMain> {
  String selectedOption = 'Auto';

  @override
  void initState() {
    super.initState();
    final mode = themeManager.value;
    selectedOption = switch (mode) {
      ThemeMode.light => 'Light',
      ThemeMode.dark => 'Dark',
      _ => 'Auto',
    };
  }

  void _onThemeChanged(String? value) {
    if (value == null) return;
    setState(() => selectedOption = value);
    final mode = switch (value) {
      'Light' => ThemeMode.light,
      'Dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
    themeManager.setTheme(mode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Appearance'),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 750),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 0, top: 20),
                      child: Text("Theme", style: TextStyle(fontSize: 15)),
                    ),
                    RadioListTile<String>(
                      title: const Text('Light'),
                      value: 'Light',
                      groupValue: selectedOption,
                      onChanged: _onThemeChanged,
                    ),
                    RadioListTile<String>(
                      title: const Text('Dark'),
                      value: 'Dark',
                      groupValue: selectedOption,
                      onChanged: _onThemeChanged,
                    ),
                    RadioListTile<String>(
                      title: const Text('Use device settings'),
                      subtitle: const Text(
                        'Apply the same theme set on your device to the app.',
                      ),
                      value: 'Auto',
                      groupValue: selectedOption,
                      onChanged: _onThemeChanged,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
