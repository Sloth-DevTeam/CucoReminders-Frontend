import 'dart:convert';

import 'package:cuco_reminders/resources/utils/app_routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url = '${BaseUrl.baseDaUrl}/';
  Future<void> signup(String fullName, String password) async {
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'fullName': fullName,
        'password': password,
      }),
    );
    debugPrint(
      jsonDecode(response.body),
    );
  }
}
