import 'package:flutter/material.dart';
import 'package:laundry_app/screens/verify_mobile.dart';

import '../screens/verify.dart';

class DetailedProfileScreen extends StatelessWidget {
  const DetailedProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
          ),
          buildProfileItem(Icons.person, 'Name', 'John Doe'),
          const Divider(),
          buildVerifiedProfileItem(
            Icons.email,
            'Email',
            'john.doe@example.com',
            () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Verify()));
            },
          ),
          const Divider(),
          buildVerifiedProfileItem(
            Icons.phone,
            'Phone number',
            '09354275932',
            () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyMobile()));
            },
          ),
        ],
      ),
    );
  }

  Widget buildProfileItem(IconData icon, String label, String value) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(label),
          subtitle: Text(value),
        ),
        const Divider(),
      ],
    );
  }

  Widget buildVerifiedProfileItem(IconData icon, String label, String value, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(label),
          subtitle: Row(
            children: [
              Text(value),
              const Spacer(),
              GestureDetector(
                onTap: onTap,
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}





