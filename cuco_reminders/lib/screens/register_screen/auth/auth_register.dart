import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthRegister with ChangeNotifier {
  static const _url =
      'https://c8c0-2804-7f7-a58a-4d7d-15f9-d08d-4a0d-f07f.sa.ngrok.io/cucoreminder/users/salvar';
  Future<void> signup(String? fullName, String? password) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: jsonEncode({
        'fullName': fullName,
        'password': password,
      }),
    );
  }
}
