import 'package:cuco_reminders/screens/home_screen/home_screen.dart';
import 'package:cuco_reminders/screens/login_screen/auth/auth_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginAuthenticate extends StatelessWidget {
  const LoginAuthenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthLogin auth = Provider.of(context);

    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('Ocorreu um erro!'),
          );
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}
