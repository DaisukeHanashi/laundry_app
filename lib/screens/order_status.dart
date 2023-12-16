import 'package:flutter/material.dart';
import '../utils/user_model.dart';
import 'track_status.dart';
import '../utils/hive_crud.dart';
import '../utils/order_model.dart';

class OrderProvider extends StatefulWidget {
  final UserModel user;

  OrderProvider({Key? key, required this.user}) : super(key: key);

  @override
  _OrderProviderState createState() => _OrderProviderState();
}

class _OrderProviderState extends State<OrderProvider> {
  late Future<List<OrderModel>> _orderListFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _orderListFuture = HiveCRUD.getOrders(widget.user.user_id);
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
      MaterialPageRoute(    builder: (context) => OrderTracking(user: widget.user),
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
          // Add a button for canceling/deleting the order
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                showDeleteConfirmationDialog(context, order);
              },
              child: Text('Cancel Order'),
            ),
          ),
        ],
      ),
    ),
  );
}

void showDeleteConfirmationDialog(BuildContext context, OrderModel order) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Cancel Order'),
        content: Text('Are you sure you want to cancel this order?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () async {
              // Implement the logic to cancel/delete the order here
              // Call a function to handle the cancellation/deletion
              bool cancellationResult = await cancelOrder(order);
              Navigator.pop(context); // Close the dialog

              // Show a dialog based on the cancellation result
              if (cancellationResult) {
                showSuccessDialog(context, 'Order canceled successfully!');
              } else {
                showErrorDialog(context, 'Failed to cancel order.');
              }
            },
            child: Text('Yes'),
          ),
        ],
      );
    },
  );
}

void showSuccessDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

void showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

Future<bool> cancelOrder(OrderModel order) async {
  try {
    await HiveCRUD.deleteOrder(order.orderID);

    // Return true if the update was successful
    return true;
  } catch (e) {
    // Log the error or handle it as needed
    print('Error updating order data: $e');

    // Return false to indicate failure
    return false;
  }
}
}       
