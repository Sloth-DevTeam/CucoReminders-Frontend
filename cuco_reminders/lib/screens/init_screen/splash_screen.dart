import 'dart:async';

import 'package:cuco_reminders/screens/onBoarding_screen/onboarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void loadCuco() {
    Timer(
      const Duration(
        seconds: 3,
      ),
      (() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OnBoarding(),
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    loadCuco();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff194429),
              Color(0xff188D35),
              Color(0xff194429),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: CircularProgressIndicator(
                  color: const Color(0xffF8BC28),
                  strokeWidth: 20,
                  backgroundColor: const Color(0xffE48B29).withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
