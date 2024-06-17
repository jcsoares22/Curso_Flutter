import 'package:chat/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 164, 240),
      body: Center(
        child: SingleChildScrollView(
          child: AuthForm(),
        ),
      ),
    );
  }
}
