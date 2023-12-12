import 'package:flutter/material.dart';
import 'package:laundry_app/screens/track_rider.dart';

class DeliveryOrder extends StatefulWidget {
  const DeliveryOrder({super.key});

  @override
  _DeliveryOrderState createState() => _DeliveryOrderState();
}

class _DeliveryOrderState extends State<DeliveryOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Order'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Berry Clean',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'To be delivered',
                  style: TextStyle(fontSize: 18.0, color: Colors.orange),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Service: wash & fold',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Preferences: none',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TrackRider(image: 'assets/driver.jpg', riderName: '', phoneNumber: '',)),
              );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(70, 40),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    'Open Gps Tracker',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(70, 40),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    'Received',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

