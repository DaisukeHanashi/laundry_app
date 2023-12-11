import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';
import '../utils/app_space.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';

class Orders extends StatelessWidget {
  final IconData icon;
  final String? type;

   const Orders({Key? key, required this.icon, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ordersImage(),
        AppSpace(
          height: 8.h,
        ),
        ordersType(),
      ],
    );
  }

  Widget ordersImage() {
    return Container(
      height: 55.h,
      width: 80.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.appContainerColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Icon(icon, size: 32.h),
      ),
    );
  }

  Widget ordersType() {
    return CustomText(
      text: type ?? AppText.item1,
      fontSize: 13.sp,
      textColor: AppColor.appFont,
      fontWeight: FontWeight.w400,
    );
  }
}
