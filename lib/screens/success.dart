import 'package:flutter/material.dart';
import 'package:laundry_app/widget/bottom_bar.dart';
 

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/success.png')),
              const Text(
                'Congratulations!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'You have successfully created a new account.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomBar()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 40), 
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), 
              ),
                ),
                child: const Text('Okay',
                style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
