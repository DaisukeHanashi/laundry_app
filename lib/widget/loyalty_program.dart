import 'package:flutter/material.dart';

class LoyaltyProgram extends StatelessWidget {
  const LoyaltyProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaundryMate Loyalty'),
         backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLoyaltyItem('300 points'),
        ],
      ),
    );
  }

  Widget buildLoyaltyItem(String order) {
    return ListTile(
      title: const Text('Classic'),
      subtitle: Text(order),
    );
  }
}
