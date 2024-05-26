import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/auth_exception.dart';

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
    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    }
    print(body);
  }

  Future<void> signup(String email, String password) async {
    return _authhenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authhenticate(email, password, 'signInWithPassword');
  }
}
