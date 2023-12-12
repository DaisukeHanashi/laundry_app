import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laundry_app/screens/landing_page.dart';
import 'utils/user_model.dart';





void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter()); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Garet-Book',
          ),
          title: 'LaundryMate',
          home: const LandingPage(),
        );
      },
    );
  }
}