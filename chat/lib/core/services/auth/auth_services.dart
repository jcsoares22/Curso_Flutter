import 'dart:io';

import 'package:chat/core/model/chat_user.dart';

abstract class AuthServices {
  ChatUser? get currentUser;


  Stream<ChatUser?> get userChanges;

  Future<void> signup(
    String nome,
    String email,
    String password,
    File image,
  );
  Future<void> login(
    String email,
    String password,
  );
 
}
