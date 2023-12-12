import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../delivery screen/delivery_signup.dart';
import 'login.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  Map<int, Map<String, String>> pageData = {
    0: {
      'image': 'assets/delivery_driver.png',
      'title': 'Delivery Driver',
      'description':
          'Join our delivery team by setting up your delivery account. Enjoy flexible schedules, efficient route planning, and real-time tracking features to make each delivery a smooth and rewarding experience.',
    },
    1: {
      'image': 'assets/customer.png',
      'title': 'Customer',
      'description':
          'Create your customer account now to enjoy a quick-easy laundry experience, with access to exclusive offers, order tracking, and faster checkout.',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            DotsIndicator(
              dotsCount: 2,
              position: currentIndex.round(),
              decorator: const DotsDecorator(
                size: Size.square(10.0),
                activeSize: Size(20.0, 10.0),
                color: Colors.grey,
                activeColor: Color(0xFF0E5C46),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  buildPage(pageData[0]!),
                  buildPage(pageData[1]!),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => const DeliverySignup()),
                                );
                if (currentIndex < 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const Login(email: '', password: '',)),
                    );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0E5C46),
                minimumSize: const Size(300, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Choose', style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget buildPage(Map<String, String> page) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          page['image']!,
          height: 250.0,
          width: 250.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20.0),
        Text(
          page['title']!,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            page['description']!,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
