import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundry_app/screens/ewallet.dart';
import 'package:laundry_app/screens/login.dart';
import 'package:laundry_app/widget/cards_screen.dart';
import 'package:laundry_app/widget/customer_support.dart';
import 'package:laundry_app/widget/detailed_profile_screen.dart';
import 'package:laundry_app/widget/loyalty_program.dart';
import 'package:laundry_app/widget/my_address.dart';
import 'package:laundry_app/widget/referral_program.dart';
import '../utils/app_color.dart';
import '../utils/custom_text.dart';
import '../utils/hive_crud.dart';
import '../utils/user_model.dart';
import '../widget/subscription.dart';

class AppDrawer extends StatelessWidget {
  final String userDisplayName;
  final String userEmail;

  const AppDrawer({
    Key? key,
    required this.userDisplayName,
    required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColor.appBannerColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/default.jpg'),
                    ),
                    Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        color: const Color.fromARGB(255, 30, 134, 105),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 10,
                        ),
                        onPressed: () => _pickImageFromGallery(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: userDisplayName,
                  fontSize: 18.sp,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: userEmail,
                  fontSize: 14.sp,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          DrawerListItem(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Wash Points',
            subtitle: 'Balance and transaction history',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Ewallet()),
              );
            },
          ),
          const Divider(),
          DrawerListItem(
            icon: Icons.person,
            title: 'View profile',
            subtitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedProfileScreen(),
                ),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.wallet_outlined,
            title: 'Payment methods',
            subtitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CardsScreen()),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.location_on_outlined,
            title: 'Addresses',
            subtitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyAddress(
                    onAddressSelected: (selectedAddress) {},
                  ),
                ),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.star_border_outlined,
            title: 'LaundryMate loyalty',
            subtitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoyaltyProgram()),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.wallet_giftcard_outlined,
            title: 'Invite friends',
            subtitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReferralProgram(),
                ),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.diamond_outlined,
            title: 'Be a LaundryMate pro',
            subtitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Subscription()),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.support_agent_outlined,
            title: 'Contact customer support',
            subtitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomerSupportPage(),
                ),
              );
            },
          ),
          const Divider(),
          DrawerListItem(
            icon: Icons.settings,
            title: 'Settings',
            subtitle: '',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          DrawerListItem(
            icon: Icons.logout,
            title: 'Logout',
            subtitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(
                    email: '',
                    password: '',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  Future<List<UserModel>> _getUsers() async {
  return await HiveCRUD.getUsers();
}


  Future<void> _pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imagePath = pickedFile.path;
      _updateProfilePicture(context, imagePath);
    }
  }

  void _updateProfilePicture(BuildContext context, String imagePath) {
    CircleAvatar newAvatar = CircleAvatar(
      radius: 40,
      backgroundImage: FileImage(File(imagePath)),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Column(
            children: [
              const Text('Profile picture updated successfully.'),
              const SizedBox(height: 10),
              newAvatar,
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class DrawerListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const DrawerListItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
