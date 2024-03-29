import 'dart:convert';

import 'package:cuco_reminders/resources/utils/app_routes_utils.dart';
import 'package:cuco_reminders/screens/home_screen/home_screen.dart';
import 'package:cuco_reminders/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff194429),
              Color(0xff173A24),
              Color(0xff188534),
            ],
          ),
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text(
                      'CUCO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/logo-text.png'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (username) {
                                if (username == null || username.isEmpty) {
                                  return 'Digite seu nome';
                                }
                                return null;
                              },
                              controller: _usernameController,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.all(22),
                                hintText: 'Nome',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.white), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.white), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (senha) {
                                if (senha == null || senha.isEmpty) {
                                  return 'Digite sua senha';
                                }
                                return null;
                              },
                              controller: _passwordController,
                              obscureText: _isHidden,
                              decoration: InputDecoration(
                                suffix: InkWell(
                                  onTap: _togglePasswordView,
                                  child: Icon(
                                    size: 16,
                                    _isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.all(22),
                                hintText: 'Senha',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.white), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Colors.white), //<-- SEE HERE
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Não tem conta ?',
                                  style: TextStyle(
                                    color: Color(0xffFFA43D),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen(),
                                      )),
                                  child: const Text(
                                    'Registre-se',
                                    style: TextStyle(
                                      color: Color(0xffFFA43D),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            logando();
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0XFFFFA43D).withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 30,
                                offset: const Offset(
                                  0,
                                  0,
                                ), // changes position of shadow
                              ),
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xffFFAB00),
                                Color(0xffE38929),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(60),
                          ),
                          width: 300,
                          height: 70,
                          child: const Center(
                            child: Text(
                              'Logar',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  logando() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    print('Logando');
    var url = Uri.parse(
      '${BaseUrl.baseDaUrl}/oauth/token',
    );
    var response = await http.post(
      url,
      headers: {
        'Authorization': 'Basic Y3VjbzpjdWNvMTIz',
        "content-type": "application/x-www-form-urlencoded"
      },
      body: {
        'username': _usernameController.text,
        'password': _passwordController.text,
        'grant_type': 'password'
      },
    );

    String data =
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var token = json.decode(response.body)['access_token'];

      var bearerToken = 'Bearer $token';

      print('Logando o $bearerToken');

      await sharedPreferences.setString('Authorization', bearerToken);

      // print()

      print('legal voce logou');
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'E-mail ou senha invalidos',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      );
    }
  }
}
