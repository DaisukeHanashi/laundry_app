import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/utils/hive_crud.dart';
import 'package:laundry_app/utils/user_model.dart' as generated;

import '../screens/edit_profile_screen.dart';

class DetailedProfileScreen extends StatefulWidget {
  @override
  _DetailedProfileScreenState createState() => _DetailedProfileScreenState();
}

class _DetailedProfileScreenState extends State<DetailedProfileScreen> {
  late generated.UserModel _user;

  @override
  void initState() {
    super.initState();
    _user = generated.UserModel(name: '', email: '', phoneNumber: '', password: '');
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userList = await HiveCRUD.getUsers();
    if (kDebugMode) {
      print('User List:');
      for (var user in userList) {
        print(
            'Name: ${user.name}, Email: ${user.email}, Phone: ${user.phoneNumber}, Password: ${user.password}');
      }
    }

    if (userList.isNotEmpty) {
      final loggedInUser = userList.firstWhere(
        (user) =>
            user.email.trim().toLowerCase() ==
                'bea.reyes@gmail.com'.trim().toLowerCase() &&
            user.password == 'bear123',
        orElse: () => generated.UserModel(
          name: '',
          email: '',
          phoneNumber: '',
          password: '',
        ),
      );

      setState(() {
        _user = loggedInUser;
      });
    }
  }

  Future<void> _deleteAccount() async {
    final userList = await HiveCRUD.getUsers();
    final index = userList.indexWhere(
      (user) =>
          user.email.trim().toLowerCase() ==
              'john.reyes@gmail.com'.trim().toLowerCase() &&
          user.password == 'john123',
    );

    if (index != -1) {
      userList.removeAt(index);

      await HiveCRUD.saveUsers(userList);

      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

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
              buildProfileItem(Icons.person, 'Name', _user.name),
              const SizedBox(height: 25),
              buildProfileItem(Icons.email, 'Email', _user.email),
              const SizedBox(height: 25),
              buildProfileItem(Icons.phone, 'Phone number', _user.phoneNumber),
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
              buildConnectedAccount(
                  'Facebook', 'Connect', const AssetImage('assets/facebook_logo.png')),
              const SizedBox(height: 25),
              buildConnectedAccount(
                  'Google', 'Connect', const AssetImage('assets/google_logo.png')),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _deleteAccount,
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
                onPressed: () {
                  _editProfile(label);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildConnectedAccount(String accountName, String action, ImageProvider<Object>? image) {
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
              padding: const EdgeInsets.only(top: 10.0),
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

  void _editProfile(String field) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          currentField: field,
          currentValue: _getValueForField(field),
          onSave: (newValue) {
            _saveChanges(field, newValue);
          },
        ),
      ),
    );
  }

  String _getValueForField(String field) {
    switch (field) {
      case 'Name':
        return _user.name;
      case 'Email':
        return _user.email;
      case 'Phone number':
        return _user.phoneNumber;
      case 'Password':
        return _user.password;
      default:
        return '';
    }
  }

  void _saveChanges(String field, String newValue) async {
    setState(() {
      switch (field) {
        case 'Name':
          _user = _user.copyWith(name: newValue);
          break;
        case 'Email':
          _user = _user.copyWith(email: newValue);
          break;
        case 'Phone number':
          _user = _user.copyWith(phoneNumber: newValue);
          break;
        case 'Password':
          _user = _user.copyWith(password: newValue);
          break;
      }
    });

    final userList = await HiveCRUD.getUsers();
    final index = userList.indexWhere(
      (user) =>
          user.email.trim().toLowerCase() ==
              'bea.reyes@gmail.com'.trim().toLowerCase() &&
          user.password == 'bear123',
    );

    if (index != -1) {
      userList[index] = _user;
      await HiveCRUD.saveUsers(userList);
    }
  }
}
