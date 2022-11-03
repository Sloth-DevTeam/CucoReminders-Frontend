import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthLogin with ChangeNotifier {
  String? _token;

  String? get token {
    return _token;
  }

  static const _url =
      'https://cucoreminders.herokuapp.com/cucoreminder/users/auth/login';

  Future<void> login(String? fullName, String? password) async {
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

  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    const url = 'https://cucoreminders.herokuapp.com/cucoreminder/lembretes';
    final response = await http.get(
      Uri.parse(url),
    );

    final body = jsonDecode(response.body);
    _token = body['token'];
    notifyListeners();
  }
}
