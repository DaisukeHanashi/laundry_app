import 'package:flutter/material.dart';
import '../utils/user_model.dart';
import 'verify_mobile.dart'; // Import the VerifyMobile screen file

class AddPhoneNumberScreen extends StatelessWidget {
  final UserModel user; 
  const AddPhoneNumberScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Phone Number'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/mobile.png')),
              const SizedBox(height: 20),
              const Text(
                'Add your phone number',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Enter your phone number in order to send your OTP security code.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              const PhoneNumberTextField(),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  VerifyMobile(user: user)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 40), 
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), 
              ),
                ),
                child: const Text('Next', 
                style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 280,
      height: 40,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(
              Icons.mobile_friendly,
              color: Colors.black,
              size: 20,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}


