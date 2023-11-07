import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';
import '../utils/app_image.dart';
import '../utils/app_space.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;
  int service = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: AppColor.appColor,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            AppSpace(
              height: 16.h,
            ),
            appBar(),
            
            SizedBox(
              height: 10.h,
            ),
            dotIndicator(),
            AppSpace(
              height: 16.h,
            ),
            categoriesText(),
            
            nearestLaundryText(),
            
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                textColor: AppColor.appFont,
                fontWeight: FontWeight.w400,
                fontSize: 20.sp,
                textAlign: TextAlign.start,
                text: 'Hello,',
              ),
              const Spacer(),
              Image.asset(
                AppImages.bell,
                height: 24.h,
              ),
              SizedBox(
                width: 16.h,
              ),
              Image.asset(
                AppImages.search,
                height: 24.h,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                AppImages.location,
                height: 16.h,
              ),
              SizedBox(
                width: 8.h,
              ),
              CustomText(
                textColor: AppColor.appFont,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                textAlign: TextAlign.start,
                text: AppText.currentLocation,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget dotIndicator() {
    return DotsIndicator(
      dotsCount: 5,
      position: i,
      decorator: DotsDecorator(
        size: Size.square(8.0.h),
        activeSize: Size(8.0, 8.0.h),
        color: const Color(0xFFEAEAEA),
        spacing: EdgeInsets.symmetric(horizontal: 4.h),
        activeColor: AppColor.appBannerColor,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
      ),
    );
  }

  Widget categoriesText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: AppText.categories,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
            textColor: AppColor.appFont,
            fontSize: 20.sp,
          ),
          CustomText(
            text: AppText.view,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            textColor: Colors.grey,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }

  Widget nearestLaundryText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: AppText.nearestLaundry,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
            textColor: AppColor.appFont,
            fontSize: 20.sp,
          ),
          CustomText(
            text: AppText.view,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            textColor: Colors.grey,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }
}
