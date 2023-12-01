import 'package:flutter/material.dart';
import 'package:laundry_app/screens/edit_profile_screen.dart';


class DetailedProfileScreen extends StatelessWidget {
  const DetailedProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xFF0E5C46),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
             onPressed: () {
              UserProfile userProfile = UserProfile(
                name: 'John Doe',
                email: 'john.doe@gmail.com',
                phoneNumber: '09354275932',
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen(userProfile: userProfile)),
              );
            },
          ),
        ],
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
          buildProfileItem(Icons.email, 'Email',
              'john.doe@gmail.com'), 
          const Divider(),
          buildProfileItem(Icons.phone, 'Phone number',
              '09354275932'), 
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
