import 'package:flutter/material.dart';

import 'track_rider.dart';

class OrderStatus {
  final String status;
  final String date;

  OrderStatus({required this.status, required this.date});
}

class OrderTracking extends StatelessWidget {
  final List<OrderStatus> orderStatusList = [
    OrderStatus(status: 'Order placed', date: '2023-12-01'),
    OrderStatus(status: 'Preparing for pick up', date: '2023-12-02'),
    OrderStatus(status: 'Order has been picked up', date: '2023-12-03'),
    OrderStatus(status: 'Order has arrived at the Laundry shop', date: '2023-12-04'),
    OrderStatus(status: 'Clothes are being washed', date: '2023-12-05'),
    OrderStatus(status: 'Clothes are being dried', date: '2023-12-06'),
    OrderStatus(status: 'Clothes are being folded', date: '2023-12-07'),
    OrderStatus(status: 'Clothes are ready for delivery', date: '2023-12-08'),
    OrderStatus(status: 'Driver has picked up the order', date: '2023-12-09'),
    OrderStatus(status: 'Driver is on its way to you', date: '2023-12-10'),
    OrderStatus(status: 'Order has been delivered', date: '2023-12-11'),
  ];

  OrderTracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracking'),
        backgroundColor: const Color(0xFF0E5C46)
      ),
      body: ListView.builder(
        itemCount: orderStatusList.length,
        itemBuilder: (context, index) {
          return OrderStatusTile(orderStatus: orderStatusList[index], isLast: index == orderStatusList.length - 1);
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TrackRider(
                  riderName: 'Christian Reyes', 
                  phoneNumber: '09218280965',
                  image: 'assets/driver.jpg'),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 40), 
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), 
              ),
                ),
          child: const Text('Track Rider'),
        ),
      ),
    );
  }
}

class OrderStatusTile extends StatelessWidget {
  final OrderStatus orderStatus;
  final bool isLast;

  const OrderStatusTile({Key? key, required this.orderStatus, required this.isLast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Icon(
              _getIconForStatus(orderStatus.status),
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderStatus.status,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  orderStatus.date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

   IconData _getIconForStatus(String status) {
    if (_isCheckedStatus(status)) {
      return Icons.check; 
    } else {
      return Icons.access_time;
    }
  }

  bool _isCheckedStatus(String status) {
    
    return [
      'Order placed',
      'Preparing for pick up',
      'Order has been picked up',
      'Order has arrived at the Laundry shop',
      'Clothes are being washed',
      'Clothes are being dried',
      'Clothes are being folded',
      'Clothes are ready for delivery',
      'Driver has picked up the order',
      'Driver is on its way to you'
    ].contains(status);
  }
}
