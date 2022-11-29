import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://d065-2804-7f7-a58a-4d7d-80c4-19b8-d121-cc08.sa.ngrok.io/';
  Future<void> signup(String fullName, String password) async {
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'fullName': fullName,
        'password': password,
      }),
    );
    debugPrint(jsonDecode(response.body));
  }
}
