import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:postalhub_tracker/src/navigator/navigator_sevices.dart';
import 'firebase_options.dart';
import 'package:postalhub_tracker/src/postalhub_ui.dart';
//import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:postalhub_tracker/src/components/theme_manager.dart';

final themeManager = ThemeManager();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor:
        Colors.transparent, // transparent on Android, translucent on iOS
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark, // Or Brightness.light
  ));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(MyApp(themeManager));
}

class MyApp extends StatelessWidget {
  final ThemeManager themeManager;
  const MyApp(this.themeManager, {super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeManager,
        builder: (context, themeMode, _) {
          return MaterialApp(
              title: "Postal Hub",
              theme: ThemeData(
                colorScheme: lightColorScheme,
                textTheme: GoogleFonts.nunitoTextTheme(),
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android:
                        PredictiveBackPageTransitionsBuilder(),
                  },
                ),
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme,
                textTheme: GoogleFonts.nunitoTextTheme().apply(
                  bodyColor: darkColorScheme.onSurface,
                  displayColor: darkColorScheme.onSurface,
                ),
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android:
                        PredictiveBackPageTransitionsBuilder(),
                  },
                ),
              ),
              themeMode: themeMode,
              debugShowCheckedModeBanner: false,
              home: const NavigatorServices());
        });
  }
}
