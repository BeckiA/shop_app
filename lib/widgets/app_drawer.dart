import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: const Text("My Shop App"),
          automaticallyImplyLeading: false,
        ),
        // Container(
        //   height: 120,
        //   width: double.infinity,
        //   padding: const EdgeInsets.all(20),
        //   alignment: Alignment.centerLeft,
        //   color: Theme.of(context).primaryColor,
        //   child: const Text(
        //     "My Shop App",
        //     style: TextStyle(
        //         fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        //   ),
        // ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: const Icon(
            Icons.shop,
            size: 26,
          ),
          title: const Text(
            "Shop",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.payment,
            size: 26,
          ),
          title: const Text(
            "My Orders",
            style: TextStyle(fontSize: 24),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          },
        )
      ],
    ));
  }
}
