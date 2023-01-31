import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final order = Provider.of<Orders>(context, listen: false);
    return Scaffold(
        appBar: AppBar(title: const Text("Cart")),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(fontSize: 20),
                    ),
                    const Spacer(), // Makes the Text to take all the available space as much as it can!
                    Chip(
                      label: Text(
                        "\$${cart.totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline6
                                ?.color),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    TextButton(
                      onPressed: () {
                        order.addOrder(
                            cart.items.values.toList(), cart.totalAmount);
                        cart.clear();
                      },
                      child: const Text("Order Now"),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => CartItem(
                  id: cart.items.values.toList()[index].id,
                  productId: cart.items.keys.toList()[index],
                  title: cart.items.values.toList()[index].title,
                  quantity: cart.items.values.toList()[index].quantity,
                  price: cart.items.values.toList()[index].price),
              itemCount: cart.itemCount,
            ))
          ],
        ));
  }
}
