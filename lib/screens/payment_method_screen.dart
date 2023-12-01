import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:laundry_app/screens/invoice.dart';
import 'package:laundry_app/widget/my_address.dart';

import 'credit.dart';

class PaymentMethodScreen extends StatefulWidget {
  final double totalAmount;

  const PaymentMethodScreen({Key? key, required this.totalAmount}) : super(key: key);

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? selectedPaymentMethod;
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void _placeOrder(BuildContext context) {
    if (selectedPaymentMethod == 'Cash') {
      _placeOrderWithCash(context);
    } else if (selectedPaymentMethod == 'Credit Card') {
      _placeOrderWithCreditCard(context);
    } else if (selectedPaymentMethod == 'GCash') {
      _placeOrderWithGCash(context);
    }
  }

  void _placeOrderWithCash(BuildContext context) {
    _showOrderConfirmation(context);
  }

  void _placeOrderWithCreditCard(BuildContext context) {
    _showOrderConfirmation(context);
  }

  void _placeOrderWithGCash(BuildContext context) {
    _showOrderConfirmation(context);
  }

  void _showOrderConfirmation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Invoice(
          totalAmount: widget.totalAmount,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Payment Method:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            RadioListTile<String>(
              title: const Text('Credit Card'),
              value: 'Credit Card',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Cash'),
              value: 'Cash',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('GCash'),
              value: 'GCash',
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            RadioListTile<String>(
                title: const Text('Cash-in Credit'),
                value: 'Cash-in credit',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CashInCreditPaymentScreen(),
                    ),
                  );
                },
              ),
            const SizedBox(height: 16),
            if (selectedPaymentMethod == 'Credit Card') ...[
              const Text(
                'Enter Credit Card Details:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: cardNumberController,
                decoration: const InputDecoration(labelText: 'Card Number'),
              ),
              TextFormField(
                controller: expiryDateController,
                decoration: const InputDecoration(labelText: 'Expiry Date'),
              ),
              TextFormField(
                controller: cvvController,
                decoration: const InputDecoration(labelText: 'CVV'),
              ),
            ] else if (selectedPaymentMethod == 'GCash') ...[
              const Text(
                'Enter GCash Details:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
            ],
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAddress(
                      onAddressSelected: (selectedAddress) {
                        setState(() {
                          addressController.text = selectedAddress;
                        });
                      },
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), 
              ),
                ),
              child: const Text('Select Address'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Enter Address:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 16),
            Text(
              'Total Amount: ₱${widget.totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: () => _placeOrder(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), 
              ),
                ),
                child: const Text('Pay Now',style: TextStyle(
                  fontSize: 18
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class UserProfileProvider extends ChangeNotifier {
  MyAddress userProfile =  MyAddress(onAddressSelected: (String ) { },); 

  void updateUserProfile(MyAddress newProfile) {
    userProfile = newProfile;
    notifyListeners();
  }
}