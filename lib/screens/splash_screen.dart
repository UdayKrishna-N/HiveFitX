// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hivefitx/constants.dart';
import 'package:hivefitx/screens/dashboard_screen.dart';
import 'package:hivefitx/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    endSplashScreen();
  }

  endSplashScreen() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    final prefs = await SharedPreferences.getInstance();
    bool isSignedIn = prefs.getBool('isSignedIn') ?? false;
    isSignedIn
        ? Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(),
            ),
          )
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'HiveFit',
                    style: styleHiveFit,
                  ),
                  TextSpan(
                    text: 'X',
                    style: styleX,
                  ),
                ],
              ),
            ),
            // sub-quote
            Text(
              "Your Fitness Tribe",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: gray1,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
