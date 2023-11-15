import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';
import '../utils/app_image.dart';
import '../utils/app_space.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';

class Categories extends StatelessWidget {
  final String? image;
  final String? type;

  const Categories({super.key, this.image, this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        categoriesImage(),
        AppSpace(
          height: 8.h,
        ),
        categoriesType(),
      ],
    );
  }

  Widget categoriesImage() {
    return Container(
      height: 55.h,
      width: 80.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.appContainerColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Image.asset(image ?? AppImages.cleaning, height: 32.h),
      ),
    );
  }

  Widget categoriesType() {
    return CustomText(
      text: type ?? AppText.item1,
      fontSize: 13.sp,
      textColor: AppColor.appFont,
      fontWeight: FontWeight.w400,
    );
  }
}
