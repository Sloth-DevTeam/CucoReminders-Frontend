import 'package:cuco_reminders/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
              Color(0xffE38929),
              Color(0xffF4A62C),
              Color(0xffFFAB00),
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: AppBar(
                  iconTheme: const IconThemeData(
                    color: Color(0xff194429),
                    size: 30,
                  ),
                  title: const Text(
                    'CUCO',
                    style: TextStyle(
                      color: Color(0xff194429),
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
                    Image.asset(
                      'assets/ocuco.png',
                      width: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.all(22),
                              hintText: 'Nome Completo',
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
                            obscureText: true,
                            decoration: InputDecoration(
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
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.all(22),
                              hintText: 'Confirma Senha',
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
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const LoginScreen())));
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
                              Color(0xff194429),
                              Color(0xff188534),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        width: 300,
                        height: 70,
                        child: const Center(
                          child: Text(
                            'Cadastrar',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
