import 'package:flutter/material.dart';
import '../screens/shop_details.dart';

class LaundryShopListScreen extends StatefulWidget {
  final String custID;

  const LaundryShopListScreen({super.key, required this.custID}); 

  @override
  _LaundryShopListScreenState createState() => _LaundryShopListScreenState();
}

class _LaundryShopListScreenState extends State<LaundryShopListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = '';
  List<String> items = ['Quick Stop Laundry', 'SoftWash Laundromat', 'Chill Laundry Lounge'];
  List<String> reviews = ['5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Star'];
  List<String> filters = ['Popular', 'Nice Staff'];

  late List<String> filteredItems;
  late String selectedReviewFilter = '5 Stars';

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
    _applyFilters();
  }

  void _applyFilters() {
    // Implement logic to apply selected filters
    // For demonstration purposes, let's assume items contain the respective filters.
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .where((item) => item.contains(selectedReviewFilter.split(" ")[0]))
          .toList();
    });
  }

  void _openFiltersScreen() {
    // Navigate to a new screen to display available filters and ratings
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FiltersScreen(filters: filters, ratings: reviews),
      ),
    ).then((selectedFilter) {
      if (selectedFilter != null) {
        setState(() {
          selectedReviewFilter = selectedFilter;
          _applyFilters();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchedChanged,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
                      hintStyle: TextStyle(color: Colors.grey.shade300),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      hintText: 'Search laundry shop',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: _openFiltersScreen,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) => ListTile(
                  title: Row(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(width: 8),
                      Text(filteredItems[index]),
                    ],
                  ),
                  onTap: () {
                    List<ShopDetail> shopDetailsList = [
                      ShopDetail(name: 'Quick Stop Laundry', rating: '4.5', image: 'assets/quickstop.jpg'),
                    ];

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShopDetails(
                          customerID: widget.custID,
                          shopDetails: shopDetailsList[index],
                          selectedImage: shopDetailsList[index].image,
                        ),
                      ),
                    );
                    setState(() {
                      _searchController.text = filteredItems[index];
                      _filterItems();
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FiltersScreen extends StatelessWidget {
  final List<String> filters;
  final List<String> ratings;

  const FiltersScreen({Key? key, required this.filters, required this.ratings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: ListView.builder(
        itemCount: filters.length + ratings.length,
        itemBuilder: (context, index) {
          if (index < filters.length) {
            return ListTile(
              title: Text(filters[index]),
              onTap: () {
                Navigator.pop(context, filters[index]);
              },
            );
          } else {
            return ListTile(
              title: Text(ratings[index - filters.length]),
              onTap: () {
                Navigator.pop(context, ratings[index - filters.length]);
              },
            );
          }
        },
      ),
    );
  }
}
