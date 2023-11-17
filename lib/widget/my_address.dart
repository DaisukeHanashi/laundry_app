import 'package:flutter/material.dart';

class MyAddress extends StatelessWidget {
  const MyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
         backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAddressItem('123 Main St., Cebu City'),
        ],
      ),
    );
  }

  Widget buildAddressItem(String address) {
    return ListTile(
      title: const Text('Home'),
      subtitle: Text(address),
    );
  }
}
