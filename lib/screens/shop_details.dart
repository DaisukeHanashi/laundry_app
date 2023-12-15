import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/screens/order_detail.dart';
import 'package:laundry_app/screens/service_detail_screen.dart';
import '../utils/app_button.dart';
import '../utils/app_color.dart';
import '../utils/app_image.dart';
import '../utils/app_space.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';
import '../utils/favorite_manager.dart';
import '../widget/my_address.dart';
import '../widget/work_categories.dart';
import '../utils/work_categories_model.dart';
import 'more_info.dart';
import 'see_reviews.dart';

class ShopDetails extends StatefulWidget {
  final ShopDetail shopDetails;
  final String? selectedImage;
  final BigInt customerID; 

  const ShopDetails({super.key, required this.shopDetails, required this.customerID, this.selectedImage});

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class ShopDetail {
  final String name;
  final String rating;
  final String image;

  ShopDetail({required this.name, required this.rating, required this.image});
}

List<ShopDetails> favoriteServices = [];

class _ShopDetailsState extends State<ShopDetails> {
  bool isPressed = false;
  int dayIndex = 0;
  bool isPressedDate = false;
  int dateIndex = 0;

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
                  height: 24.h,
                ),
                aboutShop(),
                AppSpace(
                  height: 24.h,
                ),
                services(),
                AppSpace(
                  height: 95.h,
                ),
                bookNowButton(widget.shopDetails),
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
        Image.asset(selectedImage ?? AppImages.detailsBack, width: 500),
        Container(
          height: 300.h,
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
                SizedBox(
                  width: 344.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPressed = !isPressed;
                      if (isPressed) {
                        FavoritesManager.addToFavorites(
                            widget.shopDetails as ServiceDetail);
                      } else {
                        FavoritesManager.removeFromFavorites(
                            widget.shopDetails as ServiceDetail);
                      }
                    });
                  },
                  child: Image.asset(
                    AppImages.bookMark,
                    width: 24.h,
                    height: 24.h,
                    color: isPressed ? Colors.green : AppColor.appColor,
                  ),
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
        children: [
          Row(
            children: [
              CustomText(
                text: AppText.shop4,
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
                text: widget.shopDetails.rating,
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

  Widget bookNowButton(ShopDetail shop) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetail(
              userProfile: MyAddress(
                onAddressSelected: (selectedAddress) {},
              ),
              shopPic: shop.image,
              customerID: widget.customerID,
              shopName: shop.name,
            ),
          ),
        );
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

  const PriceItem({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFF9EB384),
        borderRadius: BorderRadius.circular(12.h),
      ),
      child: Text(
        '$itemName: $itemPrice',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
