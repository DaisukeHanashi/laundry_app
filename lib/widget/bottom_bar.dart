
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/favorites.dart';
import '../screens/messaging.dart';
import '../screens/profile.dart';
import '../utils/app_color.dart';
import '../utils/app_image.dart';
import '../screens/home.dart';



class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  List<Widget> screenList = [
    const Home(),
    const Messaging(),
    const Favorites(),
    const Profile(),
    
  ];

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
          child: screenList.elementAt(AppImages.currentIndex),
        ),
        bottomNavigationBar: bottomNavigationBars(),
      ),
    );
  }
  Widget bottomNavigationBars  (){
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
      currentIndex: AppImages.currentIndex,
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
      items:  const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppImages.bHome,)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppImages.bChat)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppImages.bookMark)),
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