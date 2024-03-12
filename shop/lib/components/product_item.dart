import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              color: Color.fromARGB(255, 173, 9, 202),
              icon: Icon(Icons.edit),
              onPressed: (() {}),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (() {}),
            )
          ],
        ),
      ),
    );
  }
}
