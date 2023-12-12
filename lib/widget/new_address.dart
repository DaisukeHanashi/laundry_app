import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class NewAddressPage extends StatefulWidget {
  const NewAddressPage({Key? key}) : super(key: key);

  @override
  _NewAddressPageState createState() => _NewAddressPageState();
}

class _NewAddressPageState extends State<NewAddressPage> {
  TextEditingController streetController = TextEditingController();
  String selectedAddress = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              color: Colors.grey,
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(37.7749, -122.4194),
                  zoom: 12.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        width: 30.0,
                        height: 30.0,
                        point: LatLng(10.320871641682267, 123.89923683141133),
                        builder: (ctx) => const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Add new address',style: TextStyle(fontSize: 18)),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.blue),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '139 Gorordo Ave.',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Cebu',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _editAddress();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'We\'re missing your street',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: streetController,
              decoration: const InputDecoration(
                hintText: 'Enter your street address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _saveAndContinue();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0E5C46),
                minimumSize: const Size(double.infinity, 40),
              ),
              child: const Text('Save and Continue'),
            ),
          ],
        ),
      ),
    );
  }

  void _editAddress() {
    
  }

  void _saveAndContinue() {
    final newAddress = streetController.text;
    setState(() {
      selectedAddress = newAddress;
    });
  }
}
