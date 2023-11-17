import 'package:flutter/material.dart';

class HistoryOrders extends StatelessWidget {
  const HistoryOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildOrderItem('January 18,2023'),
          buildOrderItem('January 25,2023'),
        ],
      ),
    );
  }

  Widget buildOrderItem(String order) {
    return ListTile(
      title: const Text('Orders'),
      subtitle: Text(order),
    );
  }
}
