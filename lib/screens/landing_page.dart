import 'package:flutter/material.dart';

import 'splash_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: const Color(0xFF5DE0E6),
          ),
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                   Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),)
                  );
                },
                child: Image.asset(
                  'assets/logo-light-mode.png',
                  width: 400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
