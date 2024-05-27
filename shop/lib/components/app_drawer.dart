import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Bem vindo Usuário'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Loja'),
            onTap: (() {
              Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.AUTH_OR_HOME_PAGE);
            }),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Pedidos'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
            }),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Gerenciar Produtos'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(AppRoutes.PRODUCTS);
            }),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Sair'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            }),
          ),
        ],
      ),
    );
  }
}
