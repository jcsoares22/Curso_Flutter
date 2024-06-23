import 'dart:io';

import 'package:chat/core/model/chat_user.dart';
import 'package:chat/core/services/auth/auth_services.dart';

class AuthMockServices implements AuthServices {
  static Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;

  ChatUser? get currentUser {
    return _currentUser;
  }

  Stream<ChatUser?> get userChanges {}

  Future<void> signup(
      String nome, String email, String password, File image) async {}
  Future<void> login(String email, String password) async {}
  Future<void> logout() async {}
}
