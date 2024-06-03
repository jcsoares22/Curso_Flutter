import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/pages/auth_page.dart';
import 'package:shop/pages/products_overview_page.dart';

class AuthOrHOmePage extends StatelessWidget {
  const AuthOrHOmePage({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

  //  return auth.isAuth ? ProductsOverviewPage() : AuthPage();
  return FutureBuilder(
    future: auth.tryAutoLogin(), 
    builder: (ctx, snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator()
        );
      }else if (snapshot.error != null){
        return Center(
          child: Text('ocorreu um erro!'),
        );
      } else{
        return auth.isAuth ? ProductsOverviewPage() : AuthPage();
      }
  },
  );
  }

}
