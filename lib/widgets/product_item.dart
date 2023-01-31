import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  // late final String id;
  // late final String title;
  // late final String imageUrl;
  // ProductItem(this.id, this.title, this.imageUrl);
  Widget build(BuildContext context) {
    final products = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            products.title,
            textAlign: TextAlign.center,
          ),
          leading: Consumer<Product>(
              builder: (context, product, _) => IconButton(
                    icon: Icon(products.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      products.toogleFavouriteStatus();
                    },
                  ),
              child: const Text("Text to be not changed")),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(products.id, products.price, products.title);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            products.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed('/detailscreen', arguments: products.id);
          },
        ),
      ),
    );
  }
}
