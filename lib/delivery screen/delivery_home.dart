import 'package:flutter/material.dart';
import 'package:laundry_app/delivery%20screen/order_state.dart';
import 'package:provider/provider.dart';

class DeliveryHome extends StatefulWidget {
  const DeliveryHome({Key? key}) : super(key: key);

  @override
  _DeliveryHomeState createState() => _DeliveryHomeState();
}

class _DeliveryHomeState extends State<DeliveryHome> {
  late String _selectedTab;
  late OrderState _orderState;

  @override
  void initState() {
    super.initState();
    _selectedTab = 'New Orders';
  }

  @override
  Widget build(BuildContext context) {
    _orderState = Provider.of<OrderState>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E5C46),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          _buildTabs(),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      color: const Color(0xFF0E5C46),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTab('New Orders'),
          _buildTab('Pick-ups'),
          _buildTab('Delivered'),
        ],
      ),
    );
  }

  Widget _buildTab(String tabName) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedTab = tabName;
          _orderState.setTab(tabName);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              _selectedTab == tabName ? Colors.white : const Color(0xFF0E5C46),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        child: Text(
          tabName,
          style: TextStyle(
            color: _selectedTab == tabName ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_orderState.currentTab) {
      case 'New Orders':
        return _buildOrderList();
      default:
        return Container();
    }
  }

  Widget _buildOrderList() {
  List<Order> orders = _orderState.currentTab == 'New Orders'
      ? _orderState.newOrders
      : _orderState.pickUps;

  return ListView.builder(
    itemCount: orders.length,
    itemBuilder: (context, index) {
      return _buildOrderCard(orders[index]);
    },
  );
}


  Widget _buildOrderCard(Order order) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey.shade200,
              image: const DecorationImage(
                image: AssetImage('assets/berryclean.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.shopName,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(order.orderId),
                const SizedBox(height: 8.0),
                Text(order.status),
                const SizedBox(height: 8.0),
                Text(order.paymentType),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _orderState.moveOrder('Order 1', 'New Orders', 'Pick-ups');
                        _orderState.setTab('Pick-ups');
                      },
                      child: const Text('Accept'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle decline button click
                      },
                      child: const Text('Decline'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
