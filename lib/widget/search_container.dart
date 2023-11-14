import 'package:flutter/material.dart';

import '../screens/shop_details.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final TextEditingController _searchController = TextEditingController();

  bool isSearchedClicked = false;
  String searchText = '';
  List<String> items = ['Laundry shop', 'Plumbing shop', 'Farm shop'];

  late List<String> filteredItems;

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  void _onSearchedChanged(String value) {
    setState(() {
      searchText = value;
      _filterItems();
    });
  }

  void _filterItems() {
    if (searchText.isEmpty) {
      setState(() {
        filteredItems = List.from(items);
      });
    } else {
      setState(() {
        filteredItems = items
            .where(
                (item) => item.toLowerCase().contains(searchText.toLowerCase()))
            .toList();
      });
    }
  }

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
                  onChanged: _onSearchedChanged,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                    hintStyle: TextStyle(color: Colors.grey.shade300),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'Search laundry shop',
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isSearchedClicked = !isSearchedClicked;
                        if (!isSearchedClicked) {
                          _searchController.clear();
                          _filterItems();
                        }
                      });
                    },
                    icon: Icon(
                      isSearchedClicked ? Icons.close : Icons.search,
                    ),
                  ),
                ),
              ],
            ),
            if (isSearchedClicked)
              Container(
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(filteredItems[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShopDetails()),
                      );
                      setState(() {
                        _searchController.text = filteredItems[index];
                        isSearchedClicked = false;
                        _filterItems();
                      });
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
