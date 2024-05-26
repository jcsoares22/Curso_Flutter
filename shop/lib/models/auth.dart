import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDkKz0hGKLxSKusqvLLXYMdM48SyBaKwKw';

  Future<void> _authhenticate(
      String email, String password, String urlfragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlfragment?key=AIzaSyDkKz0hGKLxSKusqvLLXYMdM48SyBaKwKw';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    // print(jsonDecode(response.body));
  }

  Future<void> signup(String email, String password) async {
    _authhenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    _authhenticate(email, password, 'signInWithPassword');
  }
}
