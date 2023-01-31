import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../providers/product.dart';
import '../widgets/badge.dart';

enum FilterOptions {
  favourites,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  var _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    // final productStore = Provider.of<Products>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Shop App"), actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favourites) {
                  _showOnlyFavourites = true;
                } else {
                  _showOnlyFavourites = false;
                }
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: FilterOptions.favourites,
                child: Text('Only Favourites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text("Show All"),
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed('/cart');
                },
              ),
            ),
          )
        ]),
        drawer: AppDrawer(),
        body: ProductsGrid(_showOnlyFavourites));
  }
}
