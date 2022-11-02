import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url = 'https://cucoreminders.herokuapp.com/';
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
