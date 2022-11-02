import 'package:cuco_reminders/screens/init_screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const CucoApp(),
  );
}

class CucoApp extends StatelessWidget {
  const CucoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}