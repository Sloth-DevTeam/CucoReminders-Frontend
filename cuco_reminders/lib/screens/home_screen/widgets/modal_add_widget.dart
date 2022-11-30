import 'dart:convert';

import 'package:cuco_reminders/resources/utils/app_routes_utils.dart';
import 'package:cuco_reminders/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ModalAddWidget extends StatefulWidget {
  const ModalAddWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalAddWidget> createState() => _ModalAddWidgetState();
}

class _ModalAddWidgetState extends State<ModalAddWidget> {
  var prioridade = 1;
  TextEditingController controleTitulo = TextEditingController();
  TextEditingController controleDescricao = TextEditingController();
  TextEditingController controleDataVencimento = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: <Color>[
            Color(0xffE38929),
            Color(0xffF8BC28),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            flex: 1,
            child: Text(
              'Adicionar Reminder',
              style: TextStyle(
                color: Color(0xff194429),
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: controleTitulo,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.notifications),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(22),
                    hintText: 'Titulo',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
                // Prioridade
                Container(
                  width: 400,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    value: prioridade,
                    hint: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(' Selecione Prioridade'),
                    ),
                    items: [1, 2, 3, 4, 5, 6, 7, 8, 9].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        prioridade = value!;
                      });
                    },
                  ),
                ),
                // Data de entrega
                TextFormField(
                  controller: controleDataVencimento,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.all(22),
                    hintText: 'Dias até o vencimento',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controleDescricao,
                  maxLines: 3,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.all(22),
                    hintText: 'Descrição',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                adicionarReminders(controleTitulo.text, controleDescricao.text,
                    int.parse(controleDataVencimento.text), prioridade);
                Navigator.pop(
                  context,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              });
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
                  'Adicionar',
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
    );
  }
}

adicionarReminders(
  titulo,
  mensagem,
  dataVencimento,
  prioridade,
) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var date = DateTime.now();

  date.add(Duration(days: dataVencimento));

  var url = Uri.parse('${BaseUrl.baseDaUrl}/cucoreminder/lembretes/salvar');
  var response = await http.post(url,
      headers: {
        'Authorization': sharedPreferences.getString('Authorization')!,
        "Content-type": "application/json"
      },
      body: jsonEncode({
        'titulo': titulo,
        'mensagem': mensagem,
        'dataVencimento':
            "${date.day > 9 ? date.day : ("0${date.day}")}/${date.month > 9 ? date.month : ("0${date.month}")}/${date.year > 9 ? date.year : ("0${date.year}")} ${date.hour > 9 ? date.hour : ("0${date.hour}")}:${date.minute > 9 ? date.minute : ("0${date.minute}")}:${date.second > 9 ? date.second : ("0${date.second}")}",
        'prioridade': prioridade.toString(),
      }));
  print(
      "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}:${date.second}");
  print(
    response.body.toString(),
  );
  print('ai brunao se liga : $titulo, $mensagem, $prioridade,');
  print(response.statusCode);
}
