import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthLogin with ChangeNotifier {
  String? _token;

  String? get token {
    return _token;
  }

  static const _url = 'https://cucoreminders.herokuapp.com/oauth/token';

  Future login(String? username, String? password) async {
    print(username);
    final response = await http.post(
      Uri.parse(_url),
      headers: {
        'Authorization': 'Basic Y3VjbzpjdWNvMTIz',
        "content-type": "application/x-www-form-urlencoded"
      },
      body: {
        'username': username,
        'password': password,
        'grant_type': 'password'
      },
    );
    dynamic data = response;
    _token = data['acess_token'];
    // _token = json.decode(response.toString());
    print('Printando o acesstoken teste : $_token blablabla');
    return response;
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
