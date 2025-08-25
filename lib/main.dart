//INTERNAL PACKAGE
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

//import 'package:postalhub_tracker/src/auth_services/auth_snapshot.dart';
import 'package:postalhub_tracker/src/components/theme_manager.dart';
import 'package:postalhub_tracker/src/navigator/navigator_sevices.dart';
import 'package:flutter/foundation.dart';
import 'firebase_options.dart';
import 'package:postalhub_tracker/src/postalhub_ui.dart';

//EXTERNAL PACKAGE
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dynamic_color/dynamic_color.dart';

final themeManager = ThemeManager();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('key'),
    androidProvider: AndroidProvider.playIntegrity,
    appleProvider: AppleProvider.deviceCheck,
  );

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(MyApp(themeManager));
}

class MyApp extends StatelessWidget {
  final ThemeManager themeManager;
  const MyApp(this.themeManager, {super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? dynamicLight, ColorScheme? dynamicDark) {
        final ColorScheme lightScheme = dynamicLight ?? lightColorScheme;
        final ColorScheme darkScheme = dynamicDark ?? darkColorScheme;

        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeManager,
          builder: (context, themeMode, _) {
            return MaterialApp(
              title: "Postal Hub",
              theme: ThemeData(
                colorScheme: lightScheme,
                useMaterial3: true,
                textTheme: GoogleFonts.nunitoTextTheme(),
              ),
              darkTheme: ThemeData(
                colorScheme: darkScheme,
                useMaterial3: true,
                textTheme: GoogleFonts.nunitoTextTheme().apply(
                  bodyColor: darkScheme.onSurface,
                  displayColor: darkScheme.onSurface,
                ),
              ),
              themeMode: themeMode,
              debugShowCheckedModeBanner: false,
              home: NavigatorServices(),
            );
          },
        );
      },
    );
  }
}
