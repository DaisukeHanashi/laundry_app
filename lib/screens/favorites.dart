import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_app/utils/app_space.dart';
import '../utils/app_image.dart';
import '../utils/favorite_manager.dart';
import 'service_detail_screen.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: const Color(0xFF0E5C46),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: FavoritesManager.favoriteServices.length,
        itemBuilder: (context, index) {
          return _buildShopContainer(FavoritesManager.favoriteServices[index]);
        },
      ),
    );
  }

  Widget _buildShopContainer(ServiceDetail shop) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                shop.name, 
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                   FavoritesManager.removeFromFavorites(shop);
                },
              ),
            ],
          ),
          AppSpace(
            height: 12.h,
          ),
          Row(
            children: [
              Image.asset(
                shop.image,
                width: 50.0,
                height: 50.0,
              ),
              const Spacer(),
              Image.asset(
                AppImages.star,
                width: 24.h,
                height: 24.h,
              ),
              Text(
                shop.rating,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
