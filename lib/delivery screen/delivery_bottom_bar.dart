import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/delivery%20screen/delivery_home.dart';
import 'package:laundry_app/screens/chat.dart';
import '../screens/profile.dart';
import '../utils/app_color.dart';
import '../utils/app_image.dart';
import '../utils/user_model.dart';


class DeliveryBottomBar extends StatefulWidget {
  final UserModel user; 
  const DeliveryBottomBar({Key? key, required this.user}) : super(key: key);

  @override
  State<DeliveryBottomBar> createState() => _DeliveryBottomBarState();
}

class _DeliveryBottomBarState extends State<DeliveryBottomBar> {
     late List<Widget> screenList;

  @override
  void initState() {
    super.initState();
    screenList = [
      const DeliveryHome(),
      const Chat(),
      Profile(user: widget.user),
    ];
  }

  void onItemTapped(int index) {
    setState(() {
      AppImages.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: screenList.elementAt(AppImages.currentIndex.clamp(0, screenList.length - 1)),
        ),
        bottomNavigationBar: bottomNavigationBars(),
      ),
    );
  }

  Widget bottomNavigationBars() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColor.appColor,
      unselectedItemColor: const Color(0xFF707070),
      selectedIconTheme: IconThemeData(
        size: 25.h,
        color: AppColor.appBannerColor,
      ),
      unselectedIconTheme: IconThemeData(
        size: 25.h,
      ),
      type: BottomNavigationBarType.fixed,
      currentIndex: AppImages.currentIndex.clamp(0, screenList.length - 1),
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppImages.bHome)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppImages.bChat)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppImages.bProfile)),
          label: '',
        ),
      ],
    );
  }
}
