import 'package:flutter/material.dart';
import '../utils/favorite_manager.dart';



class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: FavoritesManager.favoriteServices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(FavoritesManager.favoriteServices[index].name),
            // Add more details as needed
          );
        },
      ),
    );
  }
}


