import 'package:flutter/material.dart';
import 'track_status.dart'; 
import '../utils/hive_crud.dart'; 
import '../utils/order_model.dart'; 

class OrderProvider extends StatelessWidget {
  final List<Order> orderStatus = [
    Order(
      date: '12-25-23',
      shopName: 'Berry Clean',
      shopImage: 'assets/berryclean.jpg',
    ),
    Order(
      date: '12-26-23',
      shopName: 'Rinse',
      shopImage: 'assets/rinse.png',
    ),
  ];

  OrderProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Status'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: ListView.builder(
        itemCount: orderStatus.length,
        itemBuilder: (context, index) {
          return buildOrderItem(context, orderStatus[index]);
        },
      ),
    );
  }

  void navigateToOrderTracking(BuildContext context, Order order) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderTracking(),
      ),
    );
  }

  Widget buildOrderItem(BuildContext context, Order order) {
    return GestureDetector(
      onTap: () {
        navigateToOrderTracking(context, order);
      },
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: Image.asset(
                order.shopImage,
                width: 80,
                height: 80,
              ),
              title: Row(
                children: [
                  Text(order.shopName),
                  const Spacer(),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.date),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Order {
  final String date;
  final String shopName;
  final String shopImage;

  Order({
    required this.date,
    required this.shopName,
    required this.shopImage,
  });
}
