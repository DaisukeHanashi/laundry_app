import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key});

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
          buildCardItem(
            cardImage: 'assets/visa_logo.jpg',
            cardName: 'Visa',
            cardNumber: '**** **** **** 0965',
            expirationDate: '12/23',
            availableBalance: '₱11,000.00',
          ),
        ],
      ),
    );
  }

  Widget buildCardItem({
    required String cardImage,
    required String cardName,
    required String cardNumber,
    required String expirationDate,
    required String availableBalance,
  }) {
    return ListTile(
      title: Row(
        children: [
          Image.asset(
            cardImage,
            width: 70,
            height: 70,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(availableBalance),
              ],
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          const SizedBox(width: 80),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expirationDate,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
