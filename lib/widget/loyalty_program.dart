import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoyaltyProgram extends StatelessWidget {
  final String userName = 'John Doe';
  final String membershipType = 'Classic';
  final String validUntil = '2023/12/31';
  final String statusMessage =
      'You have maintained your Classic membership status. Enjoy the perks and benefits until 2023.12.31';
  final double amountSaved = 50.00;

  const LoyaltyProgram({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaundryMate Loyalty'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Dear John Doe, You are a Laundrymate Classic member!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              _buildMembershipCard(),
              const SizedBox(height: 20),
              const Text(
                'Kick starting a new cycle!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                statusMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              _buildAmountSaved(),
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildMembershipCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    width: 300,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: const Color(0xFF0E5C46),
    ),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              membershipType,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Name: $userName\nValid until: $validUntil',
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            'assets/laundry.png', 
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}
  Widget _buildAmountSaved() {
    return Column(
      children: [
        const Text(
          'Amount Saved',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/savings.png', 
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 10),
            Text(
              '₱${amountSaved.toStringAsFixed(2)}', 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

