import 'package:flutter/material.dart';

enum AuthMode{ Signup, Login}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AuthForm> {
  final _passwordController = TextEditingController();
  AuthMode _authMode = AuthMode.Login;  
  Map<String, String> _authData = {
    'Email': '',
    'password': ''
  };
void _submit(){

}
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 320,
        width: deviceSize.width * 0.75,

        child: Form(child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
              onSaved: (email) => _authData['email'] = email ?? '',
            ),
             TextFormField(
              decoration: const InputDecoration(labelText: 'Senha'),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              controller:  _passwordController,
              onSaved: (password) => _authData['password'] = password ?? '',
              validator: (_password){ final password = _password ?? '';
              if(password.isEmpty || password.length <5 ){
                return 'Informe uma senha válida';
              }return null; }
             
            ),
            if (_authMode == AuthMode.Signup)
              TextFormField(
              decoration: const InputDecoration(labelText: 'Confirmar Senha'),
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              
              validator: (_password){
                final password = _password ?? '';
                if(password != _passwordController.text){
                  return 'Senhas informadas n]ao conferem.';

                } return null;
              },
            ),
            SizedBox(
              height: 20,
            ), 
            ElevatedButton(onPressed: _submit, child: Text(
             _authMode == AuthMode.Login ? 'Entrar' : 'Registrar',
             
            ),
            style:  ElevatedButton.styleFrom(
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
              ), 
              padding: const EdgeInsets.symmetric(
                horizontal: 
                30, vertical: 8,
              )
            ),
            
            )
          ],
        )),
      ),
    );
  }
}