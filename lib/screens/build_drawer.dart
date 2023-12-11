import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundry_app/screens/login.dart';
import 'package:laundry_app/widget/cards_screen.dart';
import 'package:laundry_app/widget/detailed_profile_screen.dart';
import 'package:laundry_app/widget/loyalty_program.dart';
import 'package:laundry_app/widget/my_address.dart';
import 'package:laundry_app/widget/referral_program.dart';
import '../utils/app_color.dart';
import '../utils/custom_text.dart';
import '../widget/subscription.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

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
                      radius: 45,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                    Container(
                      height: 30,
                      width: 30,
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
                          size: 12,
                        ),
                        onPressed: () => _pickImageFromGallery(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text: 'John Doe',
                  fontSize: 18.sp,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: 'john.doe@gmail.com',
                  fontSize: 14.sp,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          DrawerListItem(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Wash Points',
            subtitle:'Balance and transaction history' ,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          DrawerListItem(
            icon: Icons.person,
            title: 'View profile',
            subtitle:'',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DetailedProfileScreen()),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.wallet_outlined,
            title: 'Payment methods',
            subtitle:'' ,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CardsScreen()),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.location_on_outlined,
            title: 'Addresses',
            subtitle:'' ,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyAddress(
                  onAddressSelected: (selectedAddress) {
                  },
                ),),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.star_border_outlined,
            title: 'LaundryMate loyalty',
            subtitle:'' ,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoyaltyProgram()),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.wallet_giftcard_outlined,
            title: 'Invite friends',
            subtitle:'' ,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReferralProgram()),
              );
            },
          ),
          
          DrawerListItem(
            icon: Icons.diamond_outlined,
            title: 'Be a LaundryMate pro',
            subtitle:'' ,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Subscription()),
              );
            },
          ),
          DrawerListItem(
            icon: Icons.support_agent_outlined,
            title: 'Contact customer support',
            subtitle:'' ,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          DrawerListItem(
            icon: Icons.settings,
            title: 'Settings',
            subtitle:'',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          DrawerListItem(
            icon: Icons.logout,
            title: 'Logout',
            subtitle:'' ,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Login(email: '', password: '',)),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void>  _pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imagePath = pickedFile.path;
      updateProfilePicture(imagePath);
    }
  }
   void updateProfilePicture(String imagePath) {
    //  profilePictureWidget.image = FileImage(File(imagePath));
    //  uploadProfilePicture(imagePath);
  }
}

class DrawerListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DrawerListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap, 
    required subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
