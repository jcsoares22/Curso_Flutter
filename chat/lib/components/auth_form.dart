import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Entrar')),
              TextButton(
                onPressed: () {},
                child: Text('Criar um nova conta?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
