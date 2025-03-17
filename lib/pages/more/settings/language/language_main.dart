import 'package:flutter/material.dart';

class LanguageMain extends StatefulWidget {
  const LanguageMain({super.key});
  @override
  State<LanguageMain> createState() => _LanguageMainState();
}

class _LanguageMainState extends State<LanguageMain> {
  String selectedOption = 'English'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Languages'),
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
                          "Languages",
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      RadioListTile<String>(
                        title: const Text('English'),
                        value: 'English',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Bahasa Melayu'),
                        value: 'Bahasa Melayu',
                        groupValue: selectedOption,
                        onChanged: null,
                      ),
                      RadioListTile<String>(
                        title: const Text('中文 (简体)'),
                        value: '中文(简体)',
                        groupValue: selectedOption,
                        onChanged: null,
                      ),
                      RadioListTile<String>(
                        title: const Text('中文 (繁體)'),
                        value: '中文(繁體)',
                        groupValue: selectedOption,
                        onChanged: null,
                      ),
                      RadioListTile<String>(
                        title: const Text('தமிழ்'),
                        value: 'தமிழ்',
                        groupValue: selectedOption,
                        onChanged: null,
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
