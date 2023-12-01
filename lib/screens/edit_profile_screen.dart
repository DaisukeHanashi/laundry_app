import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserProfile {
  String name;
  String email;
  String phoneNumber;
  File? profileImage;

  UserProfile({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.profileImage,
  });
}

class EditProfileScreen extends StatefulWidget {
  final UserProfile userProfile;

  const EditProfileScreen({Key? key, required this.userProfile}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userProfile.name);
    _emailController = TextEditingController(text: widget.userProfile.email);
    _phoneController = TextEditingController(text: widget.userProfile.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color(0xFF0E5C46),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              saveChanges();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    print('Change profile image');
                  }
                },
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: widget.userProfile.profileImage != null
                      ? Image.file(widget.userProfile.profileImage!).image
                      : const AssetImage('assets/profile.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
          ],
        ),
      ),
    );
  }

  void saveChanges() {
    widget.userProfile.name = _nameController.text;
    widget.userProfile.email = _emailController.text;
    widget.userProfile.phoneNumber = _phoneController.text;
  }
}

