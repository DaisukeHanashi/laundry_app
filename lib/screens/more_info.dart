import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';
import '../utils/app_image.dart';
import '../utils/app_space.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';

class MoreInfo extends StatefulWidget {
  final String? selectedImage;

  const MoreInfo({Key? key, this.selectedImage}) : super(key: key);

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: AppColor.appColor,
      body: Column(
        children: [
          servicesImage(widget.selectedImage),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                serviceNameAndLocation(),
                AppSpace(
                  height: 10.h,
                ),
                information(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget servicesImage(String? selectedImage) {
    return Stack(
      children: [
        Image.asset(selectedImage ?? AppImages.berryclean),
        Container(
          height: 240.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x87000000),
                Color(0x00000000),
              ],
            ),
          ),
        ),
        Positioned(
          top: 50.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      size: 24.h, color: AppColor.appColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget serviceNameAndLocation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(
                text: AppText.bestFind,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                textColor: AppColor.appFont,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          AppSpace(
            height: 10.h,
          ),
          Row(
            children: [
              Image.asset(
                AppImages.time,
                height: 20.h,
                width: 20.h,
                color: AppColor.appBannerColor,
              ),
              SizedBox(
                width: 4.h,
              ),
              CustomText(
                text: AppText.available,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                textColor: AppColor.appFont,
              ),
            ],
          ),
          CustomText(
                text: AppText.schedule,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                textColor: AppColor.subColor,
              ),
          AppSpace(
            height: 15.h,
          ),
          Row(
            children: [
              Image.asset(
                AppImages.location,
                height: 20.h,
                width: 20.h,
              ),
              SizedBox(
                width: 4.h,
              ),
              CustomText(
                text: AppText.currentLocation,
                textAlign: TextAlign.start,
                textColor: AppColor.appFont,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ],
          ),
          AppSpace(
            height: 15.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0), 
            child: Image.asset(
              AppImages.berryLocation,
              height: 250.h,
              width: 500.h,
              fit: BoxFit.cover, 
            ),
          ),
        ],
      ),
    );
  }
  Widget information() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              CustomText(
                text: AppText.delivery,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                textColor: AppColor.appFont,
                textAlign: TextAlign.start,
              ),
              AppSpace(
                height: 5.h,
              ),
              CustomText(
                text: AppText.deliveryInfo,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                textColor: const Color(0xFF707070),
                textAlign: TextAlign.start,
              ),
              AppSpace(
                height: 8.h,
              ),
              CustomText(
                text: AppText.minimum,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                textColor: AppColor.appFont,
                textAlign: TextAlign.start,
              ),
              AppSpace(
                height: 5.h,
              ),
              CustomText(
                text: AppText.minimumInfo,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                textColor: const Color(0xFF707070),
                textAlign: TextAlign.start,
              ),
          ],
        )
    );
  }
}
