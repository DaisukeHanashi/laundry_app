import 'package:flutter/material.dart';
import '../widget/reschedul.dart';
import '../utils/order_model.dart';

class Order {
  final String storeName;
  final String pickupTime;
  final String pickupDate;
  bool isConfirmed;

  Order({
    required this.storeName,
    required this.pickupTime,
    required this.pickupDate,
    this.isConfirmed = false,
  });
}

class PickupOrders extends StatefulWidget {
    final BigInt userID;

  const PickupOrders({Key? key, required this.userID}) : super(key: key);

  @override
  _PickupOrdersState createState() => _PickupOrdersState();
}

class _PickupOrdersState extends State<PickupOrders> {
  List<Order> orders = [
    Order(storeName: 'Berry Clean', pickupTime: '10:00 am', pickupDate: '12-25-2023'),
    Order(storeName: 'Rinse', pickupTime: '11:30 am', pickupDate: '12-26-2023'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pickup Orders'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: orders.map((order) => _buildOrderItem(order)).toList(),
      ),
    );
  }

  Widget _buildOrderItem(Order order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          order.storeName,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Pick up time: ${order.pickupTime}',
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Pick up date: ${order.pickupDate}',
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (!order.isConfirmed)
              ElevatedButton(
                onPressed: () {
                  showRescheduleDialog(order);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(120, 40),
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text('Reschedule'),
              ),
            ElevatedButton(
              onPressed: () {
                showConfirmDialog(order);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(120, 40),
                backgroundColor: order.isConfirmed ? Colors.green : const Color(0xFF0E5C46),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Text(order.isConfirmed ? 'Confirmed' : 'TBC'),
            ),
          ],
        ),
        const Divider(thickness: 2.0, height: 20.0),
      ],
    );
  }

  void showRescheduleDialog(Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reschedule Order'),
          content: const Text('Do you want to reschedule this order?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Reschedule(custID: widget.userID),
                  ),
                );
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void showConfirmDialog(Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Order Pickup'),
          content: const Text('Are you sure you want to confirm the pickup of this order?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  order.isConfirmed = true;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}

