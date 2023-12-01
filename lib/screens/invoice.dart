import 'package:flutter/material.dart';
import 'package:laundry_app/screens/confirm.dart';
import '../widget/my_address.dart';

class Invoice extends StatefulWidget {
  final double totalAmount;

  const Invoice({Key? key, required this.totalAmount}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}



class _InvoiceState extends State<Invoice> {
  int tShirts = 0;
  int dresses = 0;
  int pants = 0;
  int shorts = 0;

  List<ItemPrice> itemPrices = [
    ItemPrice(item: '1-5kg', price: 100.00),
    ItemPrice(item: '6-10kg', price: 150.00),
    ItemPrice(item: '11-15kg', price: 200.00),
    ItemPrice(item: '16-20kg', price: 250.00),
  ];

  double calculateTotalWeight() {
    return (tShirts + dresses + pants + shorts).toDouble();
  }

  double calculateTotalPrice() {
    double totalWeight = calculateTotalWeight();
    double deliveryFee = 45.00;

    if (itemPrices.isNotEmpty) {
      ItemPrice applicablePrice = itemPrices.firstWhere(
        (price) =>
            totalWeight <=
            double.parse(price.item.split('-')[1].replaceAll('kg', '')),
        orElse: () => itemPrices.last,
      );

      return totalWeight * applicablePrice.price + deliveryFee;
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Invoice',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Order: ${getSelectedOrderDetails()}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Quantity: 1',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Price: ₱${calculateTotalPrice().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Delivery Fee: ₱45',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            const SizedBox(height: 20),
            Text(
              'Total: ₱${widget.totalAmount}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment Method: Visa Card',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 350),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentConfirmationScreen(
                      totalAmount: widget.totalAmount,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0E5C46),
              minimumSize: const Size(400, 40),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), 
              ),
            ),
              child: const Text('Confirm Payment',style: TextStyle(
                fontSize: 18
              ),),
            ),
          ],
        ),
      ),
    );
  }

  String getSelectedOrderDetails() {
    double totalWeight = calculateTotalWeight();
    ItemPrice applicablePrice = itemPrices.firstWhere(
      (price) =>
          totalWeight <=
          double.parse(price.item.split('-')[1].replaceAll('kg', '')),
      orElse: () => itemPrices.last,
    );

    return '${applicablePrice.item} of clothes';
  }
}

class ItemPrice {
  final String item;
  final double price;

  ItemPrice({
    required this.item,
    required this.price,
  });
}
class UserProfileProvider extends ChangeNotifier {
  MyAddress userProfile = MyAddress(onAddressSelected: (String ) {  },); 

  void updateUserProfile(MyAddress newProfile) {
    userProfile = newProfile;
    notifyListeners();
  }
}
