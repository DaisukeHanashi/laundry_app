import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../widget/my_address.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';
import '../widget/pickup_model.dart';
import '../widget/pickup_time.dart';
import '../utils/hive_crud.dart'; 
import '../utils/order_model.dart'; 

class OrderDetail extends StatefulWidget {
  final MyAddress userProfile;
  final String shopPic; 
  final String customerID; 
  final String shopName; 

  const OrderDetail({Key? key, required this.userProfile, required this.shopPic, required this.customerID, required this.shopName}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  bool hasPreferable = false;
  bool isPressedDate = false;
  int dateIndex = 0;
  String preferences = '';
  List<String> selectedPreferences = [];
  DateTime selectedDate = DateTime.now();
  DateTime bookedDate = DateTime.now(); 
  bool isScheduled = false;
  bool isRescheduled = false;
  String orderType = ''; 
  TextEditingController laundryItemController = TextEditingController();

  void _selectDate(BuildContext context) async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Type:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'walk-in',
                        groupValue: orderType,
                        onChanged: (value) {
                          setState(() {
                            orderType = value.toString();
                          });
                        },
                      ),
                      const Text('Walk-in'),
                      Radio(
                        value: 'pick-up',
                        groupValue: orderType,
                        onChanged: (value) {
                          setState(() {
                            orderType = value.toString();
                          });
                        },
                      ),
                      const Text('Pick-up'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Schedule Pickup:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                  Row(
                    children: [
                      Text(
                          'Selected Date: ${DateFormat.yMd().format(selectedDate.toLocal())}'),
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
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Laundry Item Specification:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                  TextField(
                    controller: laundryItemController,
                    decoration: const InputDecoration(
                      labelText: 'Specify laundry',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Detergents:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Column(
                    children: [
                      CheckboxListTile(
                        title: const Text('Tide'),
                        value: selectedPreferences.contains('Tide'),
                        onChanged: (bool? value) {
                          setState(() {
                            togglePreference('Tide');
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Ariel'),
                        value: selectedPreferences.contains('Ariel'),
                        onChanged: (bool? value) {
                          setState(() {
                            togglePreference('Ariel');
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Breeze'),
                        value: selectedPreferences.contains('Breeze'),
                        onChanged: (bool? value) {
                          setState(() {
                            togglePreference('Breeze');
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text('Dell'),
                        value: selectedPreferences.contains('Dell'),
                        onChanged: (bool? value) {
                          setState(() {
                            togglePreference('Dell');
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
                const Text('Additional Preferences:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      )),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        preferences = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Enter your preferences',
                    ),
                  ),
            const SizedBox(height: 16),
           Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0E5C46),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                onTap: () async {
                  bool isBookingSuccessful = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmation'),
                        content:
                            Text('Are you sure you want to book this order?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context,
                                  false); // Close the dialog with false
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.pop(
                                  context, true); // Close the dialog with true
                              // Perform the booking action here
                              await saveOrderData(
                                status: 0,
                                orderType: orderType,
                                custID: widget.customerID,
                                provID: widget.shopName,
                                price: calculateTotalPrice(),
                                address: widget.userProfile.toString(),
                                preference: selectedPreferences,
                                shopImage: widget.shopPic,
                                orderdate: this.bookedDate,
                                pickupTime: this.selectedDate,
                              );
                            },
                            child: Text('Book'),
                          ),
                        ],
                      );
                    },
                  );

                  if (isBookingSuccessful != null && isBookingSuccessful) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Order booked successfully!'),
                      ),
                    );
                  } else if (isBookingSuccessful != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Booking failed.'),
                      ),
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Book',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void togglePreference(String preference) {
    setState(() {
      if (selectedPreferences.contains(preference)) {
        selectedPreferences.remove(preference);
      } else {
        selectedPreferences.add(preference);
      }
    });
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

  double calculateTotalPrice() {
    return 0.0;
  }

  Future<void> saveOrderData({
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
  final randomOrderId = BigInt.from(Random().nextInt(999999));
  final order = OrderModel(
    orderID: randomOrderId.toString(),
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
  await HiveCRUD.addOrder(order); 
}
}
