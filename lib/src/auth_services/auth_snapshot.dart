/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/auth_services/login.dart';
import 'package:postalhub_tracker/src/navigator/navigator_sevices.dart';

class AuthSnapshot extends StatelessWidget {
  const AuthSnapshot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const NavigatorServices();
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}
*/
