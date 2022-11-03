import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthRegister with ChangeNotifier {
  static const _url =
      'https://cucoreminders.herokuapp.com/cucoreminder/users/salvar';
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
