import 'package:flutter/material.dart';
import 'package:laundry_app/screens/login.dart';
import 'package:laundry_app/screens/sign_up.dart';

class Choose extends StatelessWidget {
  const Choose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFF52FFC1), Color(0xFF25D3F9)],
              stops: [0.3, 0.7, 0.9],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 140.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'LaundryMate',
                    style: TextStyle(
                      fontFamily: 'Garet-Book',
                      fontSize: 30,
                      color: Color(0xFF52CBBE),
                    ),
                  ),
                ),
                const SizedBox(height: 250),
                GestureDetector(
                   onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login(email: 'john.doe@gmail.com', password: 'john0425',)),
                    );
                  },
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Garet-Book',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                     ),
                   ),
                 ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'or',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Garet-Book',
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        'Create an account',
                        style: TextStyle(
                            fontFamily: 'Garet-Book',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
