import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cards'),
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
