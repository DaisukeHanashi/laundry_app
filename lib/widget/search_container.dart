import 'package:flutter/material.dart';
import '../screens/laundry_shop.dart';

class SearchContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LaundryShopListScreen()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.search,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              Text(
                'Search laundry shop',
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
