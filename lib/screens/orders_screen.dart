import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  @override
  static const routeName = '/orders';
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Your Orders")),
        drawer: AppDrawer(),
        body: ListView.builder(
          itemBuilder: (context, index) => OrderItem(orderData.orders[index]),
          itemCount: orderData.orders.length,
        ));
  }
}
