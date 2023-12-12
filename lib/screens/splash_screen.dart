import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/screens/login.dart';
import '../utils/app_space.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class SplashPage extends StatelessWidget {
  final String imagePath;
  final String motive;
  final String description;

  const SplashPage({
    Key? key,
    required this.imagePath,
    required this.motive,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        splashImage(context),
        AppSpace(height: 15.h),
        splashDetails(),
      ],
    );
  }

  Widget splashImage(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300.h, 
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }

  Widget splashDetails() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: CustomText(
            text: motive,
            textAlign: TextAlign.center,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        AppSpace(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: CustomText(
            text: description,
            textAlign: TextAlign.center,
            fontSize: 16.sp,
            textColor: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildDotIndicator(0),
                  buildDotIndicator(1),
                  buildDotIndicator(2),
                  const Spacer(),
                  if (_currentPage == 2)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(email: '', password: '',)
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          'Get Started',
                          style: TextStyle(color: Color(0xFF0E5C46),
                          fontSize: 18),
                        ),
                      ),
                    ),
                  if (_currentPage < 2)
                   GestureDetector(
                     onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(email: '', password: '',)
                          ),
                        );
                      },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Color(0xFF0E5C46),
                      fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 100.0,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: const [
                      SplashPage(
                        imagePath: 'assets/ironing.png',
                        motive: AppText.appMotive1,
                        description: AppText.appDescription1,
                      ),
                      SplashPage(
                        imagePath: 'assets/delivery.png',
                        motive: AppText.appMotive2,
                        description: AppText.appDescription2,
                      ),
                      SplashPage(
                        imagePath: 'assets/track.png',
                        motive: AppText.appMotive3,
                        description: AppText.appDescription3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (_currentPage < 2)
              GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    _currentPage + 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF0E5C46),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildDotIndicator(int index) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? const Color(0xFF0E5C46) : Colors.grey,
      ),
    );
  }
}



