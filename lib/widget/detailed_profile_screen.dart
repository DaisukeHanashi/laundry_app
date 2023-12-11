import 'package:flutter/material.dart';

class DetailedProfileScreen extends StatelessWidget {
  const DetailedProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              buildProfileItem(Icons.person, 'Name', 'John Doe'),
              const SizedBox(height: 25),
              buildProfileItem(Icons.email, 'Email', 'john.doe@gmail.com'),
              const SizedBox(height: 25),
              buildProfileItem(Icons.phone, 'Phone number', '09354275932'),
              const SizedBox(height: 25),
              buildProfileItem(Icons.lock, 'Password', '********'),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Connected Accounts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              buildConnectedAccount('Facebook', 'Connect', const AssetImage('assets/facebook_logo.png')),
              const SizedBox(height: 25),
              buildConnectedAccount('Google', 'Connect', const AssetImage('assets/google_logo.png')),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {

                },
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Delete my account',
                      style: TextStyle(color: Colors.red, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildProfileItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(158, 212, 212, 212),
                  offset: Offset(
                    2.0,
                    2.0,
                  ),
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: ListTile(
              leading: Icon(icon),
              title: Text(label),
              subtitle: Text(value),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildConnectedAccount(String accountName, String action,ImageProvider<Object>? image) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(158, 212, 212, 212),
                  offset: Offset(
                    2.0,
                    2.0,
                  ),
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: ListTile(
                leading: CircleAvatar(
                backgroundImage: image,
                radius: 20,
              ),
                title: Text(accountName),
                trailing: Text(action),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
