import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_button.dart';
import '../utils/app_color.dart';
import '../utils/app_image.dart';
import '../utils/app_space.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';
import '../widget/work_categories.dart';
import '../utils/work_categories_model.dart';
import 'more_info.dart';
import 'see_reviews.dart';

class ServiceDetailScreen extends StatefulWidget {
  final ServiceDetail serviceDetail;
  final String? selectedImage;
  const ServiceDetailScreen({super.key, required this.serviceDetail, this.selectedImage});
  

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class ServiceDetail {
  final String rating;
  

 ServiceDetail(int index, {required this.rating});
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  bool isPressed = false;
  int dayIndex = 0;
  bool isPressedDate = false;
  int dateIndex = 0;

  List<ItemPrice> itemPrices = [
    ItemPrice(item: 'T-Shirt', price: '10.00'),
    ItemPrice(item: 'Suit', price: '20.00'),
    ItemPrice(item: 'Dress', price: '15.00'),
    ItemPrice(item: 'Bedding', price: '25.00'),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
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
                  height: 24.h,
                ),
                aboutShop(),
                AppSpace(
                  height: 24.h,
                ),
                services(),
                AppSpace(
                  height: 24.h,
                ),
                priceList(),
                AppSpace(
                  height: 34.h,
                ),
                totalPrice(),
                AppSpace(
                  height: 16.h,
                ),
                bookNowButton(),
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
        Image.asset(selectedImage ?? AppImages.detailsBack),  
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
                  child: Icon(Icons.arrow_back_ios_new_rounded, size: 24.h, color: AppColor.appColor),
                ),
                SizedBox(
                  width: 344.h,
                ),
                Image.asset(AppImages.bookMark, height: 24.h, width: 24.h),
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
              const Spacer(),
              SizedBox(
                width: 4.h,
              ),
            ],
          ),
          AppSpace(
            height: 8.h,
          ),
          Row(
            children: [
              Image.asset(
                AppImages.location,
                height: 20.h,
                width: 20.h,
                color: AppColor.appBannerColor,
              ),
              SizedBox(
                width: 4.h,
              ),
              CustomText(
                text: AppText.currentLocation,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                textColor: AppColor.subColor,
              ),
              const Spacer(),
              GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MoreInfo()),
                );
              },
              child: CustomText(
                text: AppText.info,
                textAlign: TextAlign.start,
                textColor: const Color(0xFF0E5C46),
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              ),
            ],
          ),
          AppSpace(
            height: 8.h,
          ),
          Row(
            children: [
              Image.asset(
                AppImages.star,
                height: 20.h,
                width: 20.h,
              ),
              SizedBox(
                width: 4.h,
              ),
              CustomText(
                text: widget.serviceDetail.rating,
                textAlign: TextAlign.start,
                textColor: AppColor.appFont,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              SizedBox(
                width: 4.h,
              ),
              CustomText(
                text: AppText.ratings,
                textAlign: TextAlign.start,
                textColor: const Color(0xFF707070),
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SeeReviews()),
                );
              },
              child: CustomText(
                text: AppText.reviews,
                textAlign: TextAlign.start,
                textColor: const Color(0xFF0E5C46),
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget aboutShop() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: SizedBox(
        height: 120.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppText.about,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              textColor: AppColor.appFont,
              textAlign: TextAlign.start,
            ),
            AppSpace(height: 2.h),
            CustomText(
              text: AppText.description,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              textColor: Colors.black,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }

  Widget services() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Services',
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            textColor: AppColor.appFont,
            textAlign: TextAlign.start,
          ),
          AppSpace(height: 8.h),
          SizedBox(
            height: 117.h,
            child: serviceCategories(),
          ),
        ],
      ),
    );
  }

  Widget serviceCategories() {
    return SizedBox(
      height: 117.h,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.h),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Categories(
            image: categoriesModel[index].image,
            type: categoriesModel[index].name,
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 20.h,
          ),
          itemCount: categoriesModel.length),
    );
  }

  Widget priceList() {
  return SizedBox(
    height: 69.h,
    child: ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 20.h, top: 16.h),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            dateIndex = index;
            isPressedDate = !isPressedDate;
          });
        },
        child: PriceItem(
          itemName: itemPrices[index].item,
          itemPrice: itemPrices[index].price,
          isSelected: dateIndex == index,
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        width: 16.h,
      ),
      itemCount: itemPrices.length,
    ),
  );
}

  Widget totalPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: AppText.totalPrice,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.start,
            textColor: AppColor.subColor,
          ),
          CustomText(
            text: AppText.price,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.end,
            textColor: AppColor.appFont,
          ),
        ],
      ),
    );
  }

  Widget bookNowButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const AppButton(
        buttonText: AppText.bookNow,
      ),
    );
  }
}

class ItemPrice {
  final String item;
  final String price;

  ItemPrice({required this.item, required this.price});
}

class PriceItem extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final bool isSelected;

  const PriceItem({Key? key, required this.itemName, required this.itemPrice, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.subColor : const Color(0xFF9EB384),
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Text(
        '$itemName: \$$itemPrice',
        style: TextStyle(
          color: isSelected ? Colors.white : AppColor.appFont,
          fontSize: 16.sp,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
        ),
      ),
    );
  }
}

