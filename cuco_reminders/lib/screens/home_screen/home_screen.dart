import 'dart:convert';

import 'package:cuco_reminders/screens/home_screen/widgets/modal_add_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> reminders;
  final _formKey = GlobalKey<FormState>();

  final _adicionarTitulo = TextEditingController();
  final _adicionarDescricao = TextEditingController();

  final _editarTitulo = TextEditingController();
  final _editarDescricao = TextEditingController();

  @override
  void initState() {
    super.initState();
    reminders = fetchReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Form(
              key: _formKey,
              child: const ModalAddWidget(),
            ),
            barrierColor: Colors.black.withOpacity(0.5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text('Reminders List'),
      ),
      body: FutureBuilder<List>(
        future: fetchReminders(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Form(
                          child: Container(
                            color: Colors.yellow,
                            child: Column(
                              children: [
                                TextFormField(),
                                TextFormField(),
                                TextFormField(),
                                MaterialButton(
                                  onPressed: () {},
                                  child: const Text('Salvar'),
                                )
                              ],
                            ),
                          ),
                        ),
                        barrierColor: Colors.black.withOpacity(0.5),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  title: Text(snapshot.data![index]['titulo']),
                  subtitle: Text(
                    snapshot.data![index]['mensagem'],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      deleteReminders(
                        snapshot.data![index]['id'].toString(),
                      );
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {}
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}

Future<List> fetchReminders() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var url = Uri.parse(
      'https://46f4-2804-7f7-a58a-4d7d-15f9-d08d-4a0d-f07f.sa.ngrok.io/cucoreminder/lembretes');
  var response = await http.get(
    url,
    headers: {
      'Authorization': sharedPreferences.getString('Authorization')!,
    },
  );
  if (response.statusCode == 200) {
    return json.decode(response.body).map((reminder) => reminder).toList();
  } else {
    throw Exception('Error get reminders');
  }
}

deleteReminders(String id) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var url = Uri.parse(
      'https://46f4-2804-7f7-a58a-4d7d-15f9-d08d-4a0d-f07f.sa.ngrok.io/cucoreminder/lembretes/deletar/$id');
  var response = await http.delete(
    url,
    headers: {
      'Authorization': sharedPreferences.getString('Authorization')!,
    },
  );
  print(
    response.body.toString(),
  );
  print(response.statusCode);
}

adicionarReminders() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var url = Uri.parse(
      'https://46f4-2804-7f7-a58a-4d7d-15f9-d08d-4a0d-f07f.sa.ngrok.io/cucoreminder/lembretes/salvar');
  var response = await http.delete(url, headers: {
    'Authorization': sharedPreferences.getString('Authorization')!,
  }, body: {
    'titulo': '(String) titulo',
    'mensagem': '(String) msg',
    'dataVencimento':
        ' (String) dataVencimento [dia+"/"+mes+"/"+ano+" "+hora+":"+minuto+":"+segundo;]',
  });
  print(
    response.body.toString(),
  );
  print(response.statusCode);
}
