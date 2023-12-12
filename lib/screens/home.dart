import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/screens/order_status.dart';
import 'package:laundry_app/screens/payment_screen.dart';
import 'package:laundry_app/screens/pickup_orders.dart';
import 'package:laundry_app/widget/history_orders.dart';
import 'package:laundry_app/widget/orders.dart';
import '../utils/app_banner.dart';
import '../utils/app_color.dart';
import '../utils/app_image.dart';
import '../utils/app_space.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';
import '../utils/work_categories_model.dart';
import '../widget/popular_shops.dart';
import '../widget/search_container.dart';
import 'build_drawer.dart';
import 'delivery_order.dart';
import 'notifications.dart';
import 'service_detail_screen.dart';
import 'to_rate.dart';

class Home extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userPhoneNumber;

  const Home({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.userPhoneNumber,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;
  int service = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLocationConfirmation();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF0E5C46),
        statusBarIconBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: AppColor.appColor,
      drawer: AppDrawer(userDisplayName:'' , userEmail: '',),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            appBar(),
            Container(
                height: 50,
                padding: const EdgeInsets.only(bottom: 12),
                decoration: const BoxDecoration(color: Color(0xFF0E5C46)),
                child: SearchContainer()),
            slider(),
            SizedBox(
              height: 10.h,
            ),
            dotIndicator(),
            AppSpace(
              height: 16.h,
            ),
            ordersText(),
            ordersLog(),
            nearestLaundryText(),
            servicesInfoList(),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0E5C46),
      toolbarHeight: 80,
      elevation: 0,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(
                textColor: AppColor.appColor,
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                textAlign: TextAlign.start,
                text: 'Home',
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notifications(),
                    ),
                  );
                },
                child: Image.asset(
                  AppImages.bell,
                  height: 30.h,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 16.h,
              ),
              Image.asset(
                AppImages.settings,
                height: 30.h,
                color: Colors.white,
              ),
            ],
          ),
          Row(
            children: [
              CustomText(
                textColor: AppColor.appColor,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
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

  Widget ordersText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: AppText.myOrders,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
            textColor: AppColor.appFont,
            fontSize: 20.sp,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryOrders()),
              );
            },
            child: const Text('View order history',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2)),
          ),
        ],
      ),
    );
  }

  Widget ordersLog() {
  return SizedBox(
    height: 117.h,
    child: ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.h),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          List<Widget> screens = [
            PaymentScreen(),  
            const PickupOrders(),
            OrderProvider(),
            const DeliveryOrder(),
            const ToRate(),
          ];
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screens[index]),
          );
        },
        child: Orders(
          icon: ordersModel[index].icon,
          type: ordersModel[index].name,
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(width: 20.h),
      itemCount: ordersModel.length,
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

  Widget servicesInfoList() {
    return SizedBox(
      height: 454.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.h),
          separatorBuilder: (context, index) => AppSpace(
                height: 16.h,
              ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailScreen(
                      serviceDetail: ServiceDetail(
                          name: 'Berry Clean ',
                          rating: '4.5',
                          image: 'assets/berryclean.jpg'),
                      selectedImage: servicesDetails[index].image,
                    ),
                  ),
                );
              },
              child: PopularShops(
                image: servicesDetails[index].image,
                title: servicesDetails[index].title,
                far: servicesDetails[index].placeFar,
                rating: servicesDetails[index].rating,
                price: servicesDetails[index].rate,
              ),
            );
          },
          itemCount: servicesDetails.length),
    );
  }

  Widget slider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: 160.0.h,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 8,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              i = index;
            });
          },
        ),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return const AppBanner();
        },
      ),
    );
  }

  void showLocationConfirmation() {
  String selectedAddress = 'Escario St. Banawa Cebu'; 

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 450,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Can you confirm if this is your location?',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Color(0xFF0E5C46)),
                  SizedBox(width: 15),
                  Text(
                    'Use my current location',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0E5C46),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Radio<String>(
                  value: 'Escario St. Banawa Cebu',
                  groupValue: selectedAddress,
                  onChanged: (String? value) {
                    setState(() {
                      selectedAddress = value!;
                    });
                  },
                  hoverColor: const Color(0xFF0E5C46),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Home', style: TextStyle(fontSize: 18)),
                    Text('Escario St. Banawa Cebu',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Radio<String>(
                  value: '28 Escario St., Cebu',
                  groupValue: selectedAddress,
                  onChanged: (String? value) {
                    setState(() {
                      selectedAddress = value!;
                    });
                  },
                  hoverColor: const Color(0xFF0E5C46),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('28 Escario St.', style: TextStyle(fontSize: 18)),
                    Text('Cebu', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Radio<String>(
                  value: 'Camputhaw Water Refilling Station, Cebu City',
                  groupValue: selectedAddress,
                  onChanged: (String? value) {
                    setState(() {
                      selectedAddress = value!;
                    });
                  },
                  hoverColor: const Color(0xFF0E5C46),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Camputhaw Water Refilling Station',
                        style: TextStyle(fontSize: 18)),
                    Text('Cebu City', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Row(
              children: [
                Icon(Icons.add, color: Color(0xFF0E5C46)),
                SizedBox(width: 15),
                Text(
                  'Select a different location',
                  style: TextStyle(color: Color(0xFF0E5C46)),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(400, 40),
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text('Confirm Location'),
              ),
            ),
          ],
        ),
      );
    },
  );
 }
}
