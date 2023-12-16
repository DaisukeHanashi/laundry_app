import 'package:flutter/material.dart';
import '../utils/user_model.dart';
import 'success.dart';

class SMSToggleScreen extends StatefulWidget {
  final UserModel user; 
  const SMSToggleScreen({Key? key, required this.user}) : super(key: key);

  @override
  _SMSToggleScreenState createState() => _SMSToggleScreenState();
}

class _SMSToggleScreenState extends State<SMSToggleScreen> {
  final TextEditingController _verificationCodeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Code'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/SMS.png')),
            const Text(
              'Enter the verification code sent to your phone number:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _verificationCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Verification Code',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _verifyCode(context);
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 40), 
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), 
              ),
                ),
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyCode(BuildContext context) {
    if (_verificationCodeController.text == '549301') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Verification Successful!'),
            content: const Text('Your phone number has been successfully verified.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Success(user: widget.user)),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Verification Failed'),
            content:
                const Text('Incorrect verification code. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

