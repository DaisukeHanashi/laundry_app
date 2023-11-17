import 'package:flutter/material.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaundryMate pro'),
         backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLoyaltyItem('ABC123'),
        ],
      ),
    );
  }

  Widget buildLoyaltyItem(String order) {
    return ListTile(
      title: const Text('Do like a laundrypro'),
      subtitle: Text(order),
    );
  }
}
