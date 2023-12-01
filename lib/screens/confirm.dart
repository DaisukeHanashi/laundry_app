import 'package:flutter/material.dart';
import 'package:share/share.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  final double totalAmount;

  const PaymentConfirmationScreen({Key? key, required this.totalAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Payment Successful!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Total Amount: ₱${totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _downloadInvoice(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), 
              ),
                ),
                child: const Text('Download Invoice'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _shareInvoice(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), 
              ),
                ),
                child: const Text('Share Invoice',style: TextStyle(
                  color: Colors.black
                ),),
              ),
              const SizedBox(height: 20),
              const Text(
                'Successfully sent to Berry Clean',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _downloadInvoice(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Downloading Invoice...')),
    );
  }

  void _shareInvoice(BuildContext context) {
    Share.share('Invoice details: Total Amount - ₱${totalAmount.toStringAsFixed(2)}');
  }
}


