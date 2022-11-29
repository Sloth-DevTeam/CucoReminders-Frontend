import 'package:cuco_reminders/screens/init_screen/splash_screen.dart';

import 'package:cuco_reminders/screens/register_screen/auth/auth_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const CucoApp(),
  );
}

class CucoApp extends StatelessWidget {
  const CucoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthRegister()),
        ],
        builder: (context, snapshot) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
