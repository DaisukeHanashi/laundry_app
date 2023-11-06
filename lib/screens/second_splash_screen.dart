import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../custom/half_circle_custom.dart';
import '../utils/app_button.dart';
import '../utils/app_space.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';
import 'third_splash_screen.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({Key? key}) : super(key: key);

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  void updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark );
  }
  @override
  void initState() {
    updateAppbar();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            splashImage(),
           AppSpace(
             height: 15.h,
           ),
            splashDetails(),
            const Spacer(),
            getStartedButton(),
            AppSpace(
              height: 36.h,
            ),
      ]),
    );
  }

  Widget splashImage (){
    return  ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        clipBehavior: Clip.none,
        width: MediaQuery.of(context).size.width,
        height: 629.h,
        child: Image.asset('assets/splash 1.png',fit: BoxFit.cover,),
      ),
    );
  }

  Widget splashDetails(){
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.h),
          child: CustomText(
            text: AppText.appMotive2,
            textAlign: TextAlign.center,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        AppSpace(
          height: 16.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.h),
          child: CustomText(
            text: AppText.appDescription2,
            textAlign: TextAlign.center,
            fontSize: 16.sp,
            textColor: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
  Widget getStartedButton(){
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => const ThirdSplashScreen(),));
      },
      child: const AppButton(
        buttonText: 'Next',
      ),
    );
  }
}