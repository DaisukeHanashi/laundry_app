import 'package:flutter/material.dart';

class HistoryOrders extends StatelessWidget {
  final List<Order> orderHistory = [
    Order(
      date: '2023-11-15',
      shopName: 'Berry Clean',
      totalAmount: 145.00,
      orderDetails: '5kg of clothes',
      shopImage: 'assets/berryclean.jpg', 
    ),
    Order(
      date: '2023-11-20',
      shopName: 'Berry Clean',
      totalAmount: 395.00,
      orderDetails: '16kg of clothes',
      shopImage: 'assets/berryclean.jpg', 
    ),
    Order(
      date: '2023-11-28',
      shopName: 'Tumbledry',
      totalAmount: 175.50,
      orderDetails: '8kg of clothes',
      shopImage: 'assets/tumbledry.jpg', 
    ),
    Order(
      date: '2023-12-05',
      shopName: 'Washerman',
      totalAmount: 200.00,
      orderDetails: '14kg of clothes',
      shopImage: 'assets/washerman.png',
    ),
    Order(
      date: '2023-12-12',
      shopName: 'Rinse',
      totalAmount: 200.00,
      orderDetails: '8kg of clothes',
      shopImage: 'assets/rinse.png', 
    ),
  ];

  HistoryOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: ListView.builder(
        itemCount: orderHistory.length,
        itemBuilder: (context, index) {
          return buildOrderItem(orderHistory[index]);
        },
      ),
    );
  }

  Widget buildOrderItem(Order order) {
  return Card(
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
              Text('₱${order.totalAmount.toStringAsFixed(2)}'),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.date),
              Text(order.orderDetails),
            ],
          ),
        ),
      ],
    ),
  );
}

}

class Order {
  final String date;
  final String shopName;
  final double totalAmount;
  final String orderDetails;
  final String shopImage;

  Order({
    required this.date,
    required this.shopName,
    required this.totalAmount,
    required this.orderDetails,
    required this.shopImage,
  });
}
