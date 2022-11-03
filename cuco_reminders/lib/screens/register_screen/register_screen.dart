import 'package:cuco_reminders/screens/register_screen/auth/auth_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _authData = {
    'fullName': '',
    'password': '',
  };

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Ocorreo um Erro'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();
    AuthRegister auth = Provider.of(context, listen: false);

    await auth.signup(
      _authData['fullName']!,
      _authData['password']!,
    );
    debugPrint(auth.toString());
  }

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
        child: Form(
          key: _formKey,
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
                              validator: (name) {
                                final fullName = name ?? '';
                                if (fullName.isEmpty) {
                                  return 'Informe um nome valido';
                                }
                                return null;
                              },
                              onSaved: (fullName) =>
                                  _authData['fullName'] = fullName ?? '',
                              keyboardType: TextInputType.name,
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
                              validator: (passwordFinal) {
                                final password = passwordFinal ?? '';
                                if (password.isEmpty || password.length < 5) {
                                  return 'Senhas informadas não conferem';
                                }
                                return null;
                              },
                              controller: _passwordController,
                              onSaved: (password) =>
                                  _authData['password'] = password ?? '',
                              keyboardType: TextInputType.visiblePassword,
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
                              validator: (passwordFinal) {
                                final password = passwordFinal ?? '';
                                if (password != _passwordController.text) {
                                  return 'Senhas informadas não conferem';
                                }
                                return null;
                              },
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
                        onPressed: _submit,
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
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
