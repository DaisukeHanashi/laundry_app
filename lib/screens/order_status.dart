import 'package:flutter/material.dart';
import 'track_status.dart';
import '../utils/hive_crud.dart';
import '../utils/order_model.dart';

class OrderProvider extends StatefulWidget {
  final BigInt userID;

  OrderProvider({Key? key, required this.userID}) : super(key: key);

  @override
  _OrderProviderState createState() => _OrderProviderState();
}

class _OrderProviderState extends State<OrderProvider> {
  late Future<List<OrderModel>> _orderListFuture;

  @override
  void initState() {
    super.initState();
    _orderListFuture = HiveCRUD.getOrders(widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Status'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: FutureBuilder<List<OrderModel>>(
        future: _orderListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No orders found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return buildOrderItem(context, snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }

  void navigateToOrderTracking(BuildContext context, OrderModel order) {
    Navigator.push(
      context,
      MaterialPageRoute(    builder: (context) => OrderTracking(),
      ),
    );
  }

  Widget buildOrderItem(BuildContext context, OrderModel order) {
    return GestureDetector(
      onTap: () {
        navigateToOrderTracking(context, order);
      },
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              leading: Image.asset(
                order.shopImage,
                width: 80,
                height: 80,
              ),
              title: Row(
                children: [
                  Text(order.provID),
                  const Spacer(),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.orderdate.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}       
