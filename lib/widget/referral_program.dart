import 'package:flutter/material.dart';

class ReferralProgram extends StatelessWidget {
  const ReferralProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite a friend'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildReferralItem('ABC123'),
        ],
      ),
    );
  }

  Widget buildReferralItem(String order) {
    return ListTile(
      title: const Text('Refer friends, Get rewards'),
      subtitle: Text(order),
    );
  }
}
