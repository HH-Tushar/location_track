import 'package:flutter/material.dart';
import 'package:location_track/env.dart';

import '../common/nav.dart';
import 'login_view.dart';
import 'register_view.dart';

class AuthLandingScreen extends StatelessWidget {
  const AuthLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                "assets/logo.png",
                height: 200,
                fit: BoxFit.fitHeight,
              ),
              Text(
                appName,
                style: textTheme.displaySmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  navigateReplaceTo(context: context,widget:LoginInScreen() );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFF00BF6D),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  "Sign In",
                  style: textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {navigateReplaceTo(context: context, widget: RegisterScreen());},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: const StadiumBorder(),
                    backgroundColor: const Color(0xFFFE9901)),
                child: Text("Sign Up", style: textTheme.titleMedium),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
