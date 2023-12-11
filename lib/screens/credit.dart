import 'package:flutter/material.dart';
import 'package:laundry_app/screens/home.dart';

class CashInCreditPaymentScreen extends StatefulWidget {
  const CashInCreditPaymentScreen({super.key});

  @override
  _CashInCreditPaymentScreenState createState() => _CashInCreditPaymentScreenState();
}

class _CashInCreditPaymentScreenState extends State<CashInCreditPaymentScreen> {
  double currentBalance = 1000.0;
  TextEditingController paymentAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash-In Credit Payment'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Current Cash-In Credit Balance: ₱$currentBalance'),
              const SizedBox(height: 20),
              TextField(
                controller: paymentAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Amount to Pay',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _processPayment();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text('Pay with Cash-In Credit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _processPayment() {
    double paymentAmount = double.tryParse(paymentAmountController.text) ?? 0.0;
    if (paymentAmount > 0 && paymentAmount <= currentBalance) {
      _showConfirmationMessage();
    } else {
      _showErrorMessage();
    }
  }

  void _showConfirmationMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Successful'),
        content: const Text('Your payment was successful. Thank you!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(
                    builder: (context) => const Home()));
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorMessage() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Payment Error'),
        content: const Text('Invalid payment amount or insufficient cash-in credit.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
