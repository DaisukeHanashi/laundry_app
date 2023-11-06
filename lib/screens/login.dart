import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                  alignment: Alignment.topCenter,
                  child: Text(
                    'LaundryMate',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF52CBBE),
                    ),
                  ),
                ),
                const SizedBox(height: 150),
                Container(
                  height: 400,
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
                        const SizedBox(height:30),
                        const Text('Email/Username',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 280,
                          height: 40,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('Password',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 280,
                          height: 40,
                          child: const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Forgot password?',
                              style: TextStyle(
                                color: Color(0xFF52CBBE),
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                              ),
                              ),
                            ],
                          ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              width: 280,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xFF0E5C46),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text('Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Center(
                          child: Text(
                            "Don't have an account? Sign Up",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
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
        ),
      ),
    );
  }
}
