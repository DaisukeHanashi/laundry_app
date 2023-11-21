import 'package:flutter/material.dart';

import 'rate.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildNotification('Reminder: Laundry pick-up scheduled for tomorrow', '9:00 AM'),
          const Divider(),
          buildNotification('You have earned 50 loyalty points!', 'Yesterday'),
          const Divider(),
          buildNotification('Special offer: 20% off on your next order!', '2 days ago'),
          const Divider(),
          buildNotification('Welcome to LaundryMate! Get started with our services.', '3 days ago'),
          const Divider(),
          buildRateNotification('Don\'t forget to rate your recent service.', '1 week ago', context),
          const Divider(),
          buildNotification('New feature: Schedule your laundry for future dates!', '2 weeks ago'),
        ],
      ),
    );
  }

  Widget buildNotification(String message, String time) {
    return ListTile(
      leading: const Icon(Icons.notifications),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget buildRateNotification(String message, String time, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rate()),
        );
      },
      child: buildNotification(message, time),
    );
  }
}
