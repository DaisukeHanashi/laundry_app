import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildStoreItem('Berry Clean', 'Service: wash & clean\nPreferences: none', '150 pesos'),
            const Divider(thickness: 2.0, height: 40.0),
            _buildStoreItem('Rinse', 'Service: fold & iron\nPreferences: none', '250 pesos'),
            const Divider(thickness: 2.0, height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreItem(String storeName, String orderDetails, String orderTotal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              storeName,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              'To pay',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              orderDetails,
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              orderTotal,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Order total: $orderTotal',
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                showPaymentConfirmationDialog();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(80, 50),
                backgroundColor: const Color(0xFF0E5C46),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ],
    );
  }

  void showPaymentConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Confirmation'),
          content: const Text('Your payment has been processed successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}


