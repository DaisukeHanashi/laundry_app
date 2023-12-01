import 'package:flutter/material.dart';
import '../screens/laundry_shop.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final TextEditingController _searchController = TextEditingController();
  bool isSearchedClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                TextField(
                  controller: _searchController,
                  onTap: () {
                    setState(() {
                      isSearchedClicked = !isSearchedClicked;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    hintText: 'Search laundry shop',
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LaundryShopListScreen()),
                      );
                    },
                    icon: Icon(
                      isSearchedClicked ? Icons.close : Icons.search,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
