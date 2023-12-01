import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferralProgram extends StatelessWidget {
  const ReferralProgram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refer friends, get rewards'),
        backgroundColor: const Color(0xFF0E5C46),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Get rewards',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 10),
            Image.asset(
              'assets/invitation.png', 
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Text('Introduce your friends to LaundryMate and earn rewards'),
            const SizedBox(height: 10),
            const Text('Your referral code:'),
             const SizedBox(height: 10),
            const Text('L4C2E5',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ),),
            const SizedBox(height: 10),
            const Text('Share your referral code with friends.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0E5C46),
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), 
              ),
              ),
              child: const Text('Share your code',style: TextStyle(
                fontSize: 18,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

