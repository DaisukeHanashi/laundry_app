import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'new_address.dart';

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
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Escario St. Banawa Cebu',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Color(0xFF0E5C46)),
                    onPressed: () {
                      // TODO: Implement edit logic
                      // You can add your logic here for editing the address
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline_outlined, color: Color(0xFF0E5C46)),
                    onPressed: () {
                      // TODO: Implement delete logic
                      // You can add your logic here for deleting the address
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 16),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '28 Escario St.',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Cebu',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Color(0xFF0E5C46)),
                    onPressed: () {
                      // TODO: Implement edit logic
                      // You can add your logic here for editing the address
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline_outlined, color: Color(0xFF0E5C46)),
                    onPressed: () {
                      // TODO: Implement delete logic
                      // You can add your logic here for deleting the address
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 16),
            ListTile(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        'Camputhaw Water ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Flexible(
                        child: Text(
                          'Refilling Station',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left:25.0),
                    child: Text(
                      'Cebu City',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Color(0xFF0E5C46)),
                    onPressed: () {
                      // TODO: Implement edit logic
                      // You can add your logic here for editing the address
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline_outlined, color: Color(0xFF0E5C46)),
                    onPressed: () {
                      // TODO: Implement delete logic
                      // You can add your logic here for deleting the address
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewAddress(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(355, 45),
          backgroundColor: const Color(0xFF0E5C46),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: const Text('Add new address',
        style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
