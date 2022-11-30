import 'dart:convert';

import 'package:cuco_reminders/resources/utils/app_routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthRegister with ChangeNotifier {
  static const _url = '${BaseUrl.baseDaUrl}/cucoreminder/users/salvar';
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
