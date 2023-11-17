import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cards'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCardItem('**** **** **** 1234'),
        ],
      ),
    );
  }

  Widget buildCardItem(String cardNumber) {
    return ListTile(
      title: const Text('Card Number'),
      subtitle: Text(cardNumber),
    );
  }
}
