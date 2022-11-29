import 'dart:convert';

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

  @override
  void initState() {
    super.initState();
    reminders = fetchReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ));
  }
}

Future<List> fetchReminders() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  var url = Uri.parse(
      'https://d065-2804-7f7-a58a-4d7d-80c4-19b8-d121-cc08.sa.ngrok.io/cucoreminder/lembretes');
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
      'https://d065-2804-7f7-a58a-4d7d-80c4-19b8-d121-cc08.sa.ngrok.io/cucoreminder/lembretes/deletar/$id');
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
      'https://d065-2804-7f7-a58a-4d7d-80c4-19b8-d121-cc08.sa.ngrok.io/cucoreminder/lembretes/salvar');
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
