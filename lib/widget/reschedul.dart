import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:laundry_app/screens/pickup_orders.dart';
import '../utils/hive_crud.dart'; 
import '../utils/app_color.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';
import '../utils/order_model.dart';
import '../utils/user_model.dart'; 
import 'pickup_model.dart';
import 'pickup_time.dart';

class Reschedule extends StatefulWidget {
  final OrderModel exOrder; 
  final UserModel user; 
  const Reschedule({super.key, required this.user, required this.exOrder});

  @override
  _RescheduleState createState() => _RescheduleState();
}

class _RescheduleState extends State<Reschedule> {
  bool isPressedDate = false;
  int dateIndex = 0;
  List<String> selectedPreferences = [];
  DateTime selectedDate = DateTime.now();
  DateTime updatedDate = DateTime.now(); 
  bool isScheduled = false;
  bool isRescheduled = false;
  TimeOfDay selectedTime = TimeOfDay.now();
  String rescheduleReason = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reschedule Order'),
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pickup Date:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  'Selected Date: ${DateFormat.yMd().format(selectedDate.toLocal())}',
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            pickUpTimeText(),
            selectTime(),
            if (isScheduled && !isRescheduled)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isRescheduled = !isRescheduled;
                  });
                },
                child: const Text('Reschedule'),
              ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 8.0),
           
            const SizedBox(height: 16.0),
            const Text(
              'Reason for Reschedule:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  rescheduleReason = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Enter reason here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showResecheduleDialog();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(420, 40),
                  backgroundColor: const Color(0xFF0E5C46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text('Confirm Reschedule'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showResecheduleDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Updating Confirmation'),
          content: const Text('Are you sure to reschedule the pickup?'),
            actions: [
          TextButton(
            onPressed: () async {
             bool isUpdateSuccessful = await saveOrderData(
                orderID: widget.exOrder.orderID,
                status: widget.exOrder.status, 
                orderType: widget.exOrder.orderType, 
                custID: widget.exOrder.custID, 
                provID: widget.exOrder.provID, 
                price: widget.exOrder.price, 
                address: widget.exOrder.address, 
                preference: widget.exOrder.preference, 
                shopImage: widget.exOrder.shopImage, 
                orderdate: updatedDate, 
                pickupTime: selectedDate);
                showConfirmationDialog(isUpdateSuccessful);
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text('No'),
            )
        ],
        );
      }
    );
  }

  void showConfirmationDialog(bool isIt) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      switch (isIt) {
          case true:
            return AlertDialog(
              title: const Text('Reschedule Confirmation'),
              content: const Text(
                'Order successfully rescheduled!',
                style: TextStyle(
                  color: Colors.green, // Set the text color to green
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PickupOrders(user: widget.user),
                      ),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          default:
            return AlertDialog(
              title: const Text('Reschedule Confirmation'),
              content: const Text(
                'Order failed to reschedule',
                style: TextStyle(
                  color: Colors.red, // Set the text color to green
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
        }
    },
  );
}


  Widget pickUpTimeText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: CustomText(
        text: AppText.pickupTime,
        fontWeight: FontWeight.w400,
        fontSize: 18.sp,
        textAlign: TextAlign.start,
        textColor: AppColor.appFont,
      ),
    );
  }

  Widget selectTime() {
    return SizedBox(
      height: 66.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 12.h),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              dateIndex = index;
              isPressedDate = !isPressedDate;
            });
          },
          child: PickUpTime(
            time: pickupTime[index],
            isPressed: dateIndex == index,
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 16.h,
        ),
        itemCount: pickupTime.length,
      ),
    );
  }
}

Future<bool> saveOrderData({
  required String orderID,
  required int status,
  required String orderType,
  required String custID,
  required String provID,
  required double price,
  required String address,
  required List<String> preference,
  required String shopImage,
  required DateTime orderdate,
  required DateTime pickupTime,
}) async {
  try {
    final order = OrderModel(
      orderID: orderID,
      status: status,
      orderType: orderType,
      custID: custID,
      provID: provID,
      price: price,
      address: address,
      preference: preference,
      shopImage: shopImage,
      orderdate: orderdate,
      pickupTime: pickupTime,
    );

    await HiveCRUD.updateOrder(order.orderID, order);

    // Return true if the update was successful
    return true;
  } catch (e) {
    // Log the error or handle it as needed
    print('Error updating order data: $e');

    // Return false to indicate failure
    return false;
  }
}

