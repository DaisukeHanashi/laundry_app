import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laundry_app/screens/login.dart';
import 'package:laundry_app/widget/history_orders.dart';
import 'package:laundry_app/widget/loyalty_program.dart';
import 'package:laundry_app/widget/my_address.dart';
import 'package:laundry_app/widget/referral_program.dart';
import 'package:laundry_app/widget/subscription.dart';

import '../widget/cards_screen.dart';
import '../widget/detailed_profile_screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: const Color(0xFF0E5C46),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40.0),
              _buildProfilePic(),
              const SizedBox(height: 30.0),
              _buildProfileSection(context, 'View profile', Icons.person),
              const SizedBox(height: 10.0),
              _buildSection(context,
                  'My cards', '**** **** **** 1234',Icons.credit_card, null, const CardsScreen()),
              const SizedBox(height: 10.0),
              _buildSection(context, 'Addresses', '123 Main St, City', Icons.location_on_outlined, null, const MyAddress()),
              const SizedBox(height: 10.0),
              _buildSection(context, 'Order history', 'January 1, 2023', Icons.list_alt_outlined,null, const HistoryOrders()),
              const SizedBox(height: 10.0),
              _buildSection(context, 'LaundryMate loyalty', '150 points',Icons.star_border_outlined, null, const LoyaltyProgram()),
              const SizedBox(height: 10.0),
              _buildSection(context, 'Invite friends', 'ABC123', Icons.wallet_giftcard_outlined, null, const ReferralProgram()),
              const SizedBox(height: 10.0),
              _buildSection(context, 'Be a LaundryMate pro', 'Premium', Icons.diamond_outlined, null, const Subscription()),
              const SizedBox(height: 40.0),
              _buildLogoutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePic() {
    return const CircleAvatar(
      radius: 60.0,
      backgroundImage: AssetImage('assets/profile.jpg'),
    );
  }

Widget _buildProfileSection(BuildContext context, String title, IconData iconData) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailedProfileScreen(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(iconData, color: const Color(0xFF0E5C46)),
                  const SizedBox(width: 8.0), 
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      const Divider(
        height: 1,
        color: Colors.black,
      ),
    ],
  );
}

 Widget _buildSection(
  BuildContext context,
  String title,
  String subtitle1,
  IconData iconData,
  [String? subtitle2, Widget? screen]) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          if (screen != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(iconData, color: const Color(0xFF0E5C46)),
                  const SizedBox(width: 8.0), 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      if (subtitle2 != null) Text(subtitle2),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      const Divider(
        height: 2,
        color: Colors.black,
      ),
    ],
  );
}

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color(0xFF0E5C46),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
