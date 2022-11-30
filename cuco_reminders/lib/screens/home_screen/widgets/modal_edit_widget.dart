import 'dart:convert';

import 'package:cuco_reminders/resources/utils/app_routes_utils.dart';
import 'package:cuco_reminders/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/reminder_model.dart';

class ModalEditWidget extends StatefulWidget {
  final Reminder reminder;
  const ModalEditWidget({Key? key, required this.reminder}) : super(key: key);

  @override
  State<ModalEditWidget> createState() => _ModalEditWidgetState();
}

class _ModalEditWidgetState extends State<ModalEditWidget> {
  var prioridade = 1;

  TextEditingController controleTitulo = TextEditingController();

  TextEditingController controleDescricao = TextEditingController();

  TextEditingController controleDataVencimento = TextEditingController();

  @override
  void initState() {
    prioridade = widget.reminder.prioridade;
    controleTitulo.text = widget.reminder.titulo;
    controleDescricao.text = widget.reminder.legenda;
    controleDataVencimento.text = widget.reminder.dataVencimento;
    super.initState();
  }

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
              'Editar Reminder',
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
                editarReminders(
                  widget.reminder.id,
                  controleTitulo.text,
                  controleDescricao.text,
                  widget.reminder.dataVencimento,
                  prioridade,
                );
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
                  'Editar',
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

editarReminders(
  id,
  titulo,
  mensagem,
  dataVencimento,
  prioridade,
) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var url =
      Uri.parse('${BaseUrl.baseDaUrl}/cucoreminder/lembretes/atualizar/$id');
  var response = await http.put(url,
      headers: {
        'Authorization': sharedPreferences.getString('Authorization')!,
        "Content-type": "application/json"
      },
      body: jsonEncode({
        'titulo': titulo,
        'mensagem': mensagem,
        'dataVencimento': dataVencimento,
        'prioridade': prioridade.toString(),
      }));

  print(
    response.body.toString(),
  );
  print('ai brunao se liga : $titulo, $mensagem, $prioridade,');
  print(response.statusCode);
}
