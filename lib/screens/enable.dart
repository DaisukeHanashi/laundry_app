import 'package:flutter/material.dart';

import '../utils/user_model.dart';
import 'authentication.dart';
import 'email.dart';
import 'sms.dart';

class TwoFactorAuthenticationSetup extends StatefulWidget {
  final UserModel user; 
  const TwoFactorAuthenticationSetup({Key? key, required this.user}) : super(key: key);

  @override
  _TwoFactorAuthenticationSetupState createState() =>
      _TwoFactorAuthenticationSetupState();
}

class _TwoFactorAuthenticationSetupState
    extends State<TwoFactorAuthenticationSetup> {
  bool smsToggle = false;
  bool emailToggle = false;
  bool authenticatorToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Set up 2 Factor Authentication',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Choose any method you want your security codes sent to you.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            buildToggleOption('SMS-based OTP', smsToggle, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  SMSToggleScreen(user: widget.user),
                ),
              );
            }),
            const SizedBox(height: 16),
            buildToggleOption('Email-based OTP', emailToggle, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  EmailToggleScreen(user: widget.user),
                ),
              );
            }),
            const SizedBox(height: 16),
            buildToggleOption('Authentication App', authenticatorToggle, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  AuthenticatorToggleScreen(user: widget.user),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildToggleOption(
      String label, bool toggleValue, VoidCallback onPressed) {
    return Row(
      children: [
        Text(label),
        const Spacer(),
        Switch(
          value: toggleValue,
          onChanged: (value) {
            setState(() {
              toggleValue = value;
            });
            onPressed();
          },
        ),
      ],
    );
  }
}





