import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAddress extends StatefulWidget {
  final void Function(String) onAddressSelected;

  const MyAddress({Key? key, required this.onAddressSelected}) : super(key: key);

  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  String selectedAddress = '123 Main St., Cebu City';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Addresses'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text('Home', style: TextStyle(
              fontSize: 20
            ),),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 8), 
                  Expanded(
                    child: Text(
                      'N. Escario St. Banawa, Cebu City',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              trailing: Radio<String>(
                value: 'N. Escario St. Banawa, Cebu City',
                groupValue: selectedAddress,
                onChanged: (String? value) {
                  setState(() {
                    selectedAddress = value!;
                    widget.onAddressSelected(selectedAddress);
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('Home 2', style: TextStyle(
              fontSize: 20
            ),),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.location_city),
                  SizedBox(width: 8), 
                  Expanded(
                    child: Text(
                      'Gorordo Ave. Lahug, Cebu City',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              trailing: Radio<String>(
                value: 'Gorordo Ave. Lahug, Cebu City',
                groupValue: selectedAddress,
                onChanged: (String? value) {
                  setState(() {
                    selectedAddress = value!;
                    widget.onAddressSelected(selectedAddress);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
