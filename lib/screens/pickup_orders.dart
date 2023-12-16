import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widget/reschedul.dart';
import '../utils/order_model.dart';
import '../utils/user_model.dart';
import '../utils/hive_crud.dart';
import '../screens/home.dart';

class Order {
  final String storeName;
  final String pickupTime;
  final String pickupDate;
  bool isConfirmed;

  Order({
    required this.storeName,
    required this.pickupTime,
    required this.pickupDate,
    this.isConfirmed = false,
  });
}

class PickupOrders extends StatefulWidget {
    final UserModel user;

  const PickupOrders({Key? key, required this.user}) : super(key: key);

  @override
  _PickupOrdersState createState() => _PickupOrdersState();
}

class _PickupOrdersState extends State<PickupOrders> {
  late Future<List<OrderModel>> _orderListFuture; 

   @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Perform actions that should run every time the widget is built here
    _orderListFuture = HiveCRUD.getOrders(widget.user.user_id);
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Pickup Orders'),
      backgroundColor: const Color(0xFF0E5C46),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(
                user: widget.user,
              ),
            ),
          ),
        ),
    ),
    body: FutureBuilder<List<OrderModel>>(
      future: _orderListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the data
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle errors
          return  Center( 
            child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Handle the case where there is no data
          return const Center( 
            child: Text('No orders available.'));
        } else {
          // Data is available, build the ListView
          List<OrderModel> _orderList = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: _orderList.map((order) => _buildOrderItem(order)).toList(),
          );
        }
      },
    ),
  );
}

  Widget _buildOrderItem(OrderModel order) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          order.provID,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Pick up time: ${DateFormat('h:mm a').format(order.pickupTime)}',
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          'Pick up date: ${DateFormat('yyyy-MM-dd').format(order.pickupTime)}',
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (order.status == 0)
              ElevatedButton(
                onPressed: () {
                  showRescheduleDialog(order);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(120, 40),
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text('Reschedule'),
              ),
            ElevatedButton(
              onPressed: () {
                showConfirmDialog(order);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(120, 40),
                backgroundColor: order.status == 1 ? Colors.green : const Color(0xFF0E5C46),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: Text(order.status == 1 ? 'Confirmed' : 'TBC'),
            ),
          ],
        ),
        const Divider(thickness: 2.0, height: 20.0),
      ],
    );
  }

  void showRescheduleDialog(OrderModel order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reschedule Order'),
          content: const Text('Do you want to reschedule this order?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Reschedule(user: widget.user, exOrder: order,),
                  ),
                );
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void showConfirmDialog(OrderModel order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Order Pickup'),
          content: const Text('Are you sure you want to confirm the pickup of this order?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  order.status = 1;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}

