import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCardItem(
            cardImage: 'assets/GCash.jpg',
            cardName: 'Gcash Payment',
            cardNumber: '63-9****75932',
          ),
          const SizedBox(height: 16),
          buildCardItem(
            cardImage: 'assets/paymaya.png',
            cardName: 'PayMaya Payment',
            cardNumber: '4***-****-****-1234',
          ),
        ],
      ),
    );
  }

  Widget buildCardItem({
    required String cardImage,
    required String cardName,
    required String cardNumber,
  }) {
    return ListTile(
      title: Row(
        children: [
          Image.asset(
            cardImage,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios), // Trailing arrow forward icon
          const SizedBox(width: 8),
        ],
      ),
      subtitle: Row(
        children: [
          const SizedBox(width: 60),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardNumber,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
