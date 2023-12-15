import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:laundry_app/delivery%20screen/verify_account.dart';
import 'package:laundry_app/screens/account.dart';
import '../screens/login.dart';
import '../utils/user_model.dart';

class DeliverySignup extends StatefulWidget {
  const DeliverySignup({Key? key}) : super(key: key);

  @override
  _DeliverySignupState createState() => _DeliverySignupState();
}

class _DeliverySignupState extends State<DeliverySignup> {
   TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color.fromARGB(255, 46, 143, 107)],
              stops: [0.35, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, left: 10.0),
                    child: GestureDetector(
                      onTap: () {
                            Navigator.push( context, MaterialPageRoute(
                                      builder: (context) =>
                                          const AccountScreen()),
                                );
                          },
                      child: const Icon(Icons.arrow_back_ios_new_outlined,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xFF52CBBE),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Just a few quick things to get started.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 90),
                    Container(
                      height: 440,
                      width: 325,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            const Center(
                              child: Text(
                                'Create an account',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const SizedBox(
                              width: 280,
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Email Address',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const SizedBox(
                              width: 280,
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Phone Number',
                              style: TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 5),
                            const SizedBox(
                              width: 280,
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Password',
                              style: TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 280,
                              height: 40,
                              child: TextField(
                                controller: passwordController,
                                obscureText: !isPasswordVisible,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () async {
                                await saveUserData(
                                  user_id: BigInt.from(1),
                                  name: 'John Doe',
                                  email: 'john@example.com',
                                  phoneNumber: '1234567890',
                                  password: passwordController.text,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VerifyAccount()),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 280,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xFF0E5C46),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveUserData({
    required BigInt user_id,
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final userBox = await Hive.openBox<UserModel>('users');
    final user = UserModel(
      user_id: user_id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
    userBox.add(user);
    await userBox.close();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Login(
          email: email,
          password: password,
        ),
      ),
    );
  }
}
