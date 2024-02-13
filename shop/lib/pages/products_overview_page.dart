import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/badge.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/utils/app_routes.dart';

enum filterOptions {
  favorite,
  All,
}

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    //  final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: const Text('Somente Favorito'),
                value: filterOptions.favorite,
              ),
              PopupMenuItem(
                child: Text('Todos'),
                value: filterOptions.All,
              ),
            ],
            onSelected: (filterOptions selectedValue) {
              setState(() {
                if (selectedValue == filterOptions.favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
              icon: Icon(Icons.shopping_cart),
            ),
            builder: (ctx, cart, child) => Badgee(
              value: cart.itemCount.toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
      drawer: const AppDrawer(),
    );
  }
}
