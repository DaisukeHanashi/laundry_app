import 'package:flutter/material.dart';

class UserModel {
  String name;
  String email;
  String phoneNumber;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }
}
class EditProfileScreen extends StatelessWidget {
  final String currentField;
  final String currentValue;
  final Function(String) onSave;

  const EditProfileScreen({super.key, 
    required this.currentField,
    required this.currentValue,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit $currentField'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Edit $currentField:'),
            TextFormField(
              initialValue: currentValue,
              onChanged: onSave,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
