import 'package:flutter/material.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaundryMate Pro'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSubscriptionItem(),
          const Spacer(),
          buildBottomSection(),
        ],
      ),
    );
  }

  Widget buildSubscriptionItem() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Be a LaundryMate Pro',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'The all-in-one plan you need to unlock exclusive benefits across LaundryMate.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                buildBenefit('30% off shops', Icons.local_offer),
                const Divider(),
                buildBenefit('Unlimited free delivery (up to ₱45)', Icons.delivery_dining),
                const Divider(),
                buildBenefit('Extra 5% off pick-up', Icons.shopping_cart),
                const Divider(),
                buildBenefit('Earn additional loyalty points or rewards', Icons.star),
                const Divider(),
                buildBenefit('Early access to new features', Icons.access_time),
                const Divider(),
                buildBenefit('Dedicated customer support', Icons.headset_mic),
                const Divider(),
                buildBenefit('Priority scheduling for pick-up and delivery', Icons.schedule),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Starting from ₱50.00/mo.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0E5C46)
              ),
            child: const Text('Subscribe Now'),
          ),
        ],
      ),
    );
  }

  Widget buildBenefit(String benefitText, IconData iconData) {
  return ListTile(
    leading: Icon(iconData, color: const Color(0xFF0E5C46)), 
    title: Text(benefitText),
  );
}

  
}
