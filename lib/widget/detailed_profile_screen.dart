import 'package:flutter/material.dart';

class DetailedProfileScreen extends StatelessWidget {
  const DetailedProfileScreen({super.key});

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
          buildProfileItem(Icons.email, 'Email', 'john.doe@example.com'),
          const Divider(),
          buildProfileItem(Icons.phone, 'Phone number', '09354275932'),
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
}
