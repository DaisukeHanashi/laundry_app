import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:laundry_app/screens/invoice.dart';
import '../widget/my_address.dart';
import '../utils/app_color.dart';
import '../utils/app_string.dart';
import '../utils/custom_text.dart';
import '../widget/pickup_model.dart';
import '../widget/pickup_time.dart';
import 'payment_method_screen.dart';


class ItemPrice {
  final String item;
  final double price;

  ItemPrice({required this.item, required this.price});
}

class OrderDetail extends StatefulWidget {
  final MyAddress userProfile;

  const OrderDetail({Key? key, required this.userProfile}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}



class _OrderDetailState extends State<OrderDetail> {
  int tShirts = 0;
  int dresses = 0;
  int pants = 0;
  int shorts = 0;
  bool hasPreferable = false;
  bool isPressedDate = false;
  int dateIndex = 0;
  String preferences = '';
  List<String> selectedPreferences = [];
  DateTime selectedDate = DateTime.now();

  List<ItemPrice> itemPrices = [
    ItemPrice(item: '1-5kg', price: 100.00),
    ItemPrice(item: '6-10kg', price: 150.00),
    ItemPrice(item: '11-15kg', price: 200.00),
    ItemPrice(item: '16-20kg', price: 250.00),
  ];

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

double calculateTotalWeight() {
  return (tShirts + dresses + pants + shorts).toDouble();
}

double calculateTotalPrice() {
  double totalWeight = calculateTotalWeight();
  double deliveryFee = 45.00;

  if (itemPrices.isNotEmpty) {
    ItemPrice applicablePrice = itemPrices.firstWhere(
      (price) =>
          totalWeight <=
          double.parse(price.item.split('-')[1].replaceAll('kg', '')),
      orElse: () => itemPrices.last,
    );

    return totalWeight * applicablePrice.price + deliveryFee;
  } else {
    return 0.0;
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
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Items:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      const Text('1-5kg:'),
                      const Spacer(),
                      Checkbox(
                        value: tShirts > 0,
                        onChanged: (bool? value) {
                          setState(() {
                            tShirts = value! ? 1 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('6-10kg:'),
                      const Spacer(),
                      Checkbox(
                        value: dresses > 0,
                        onChanged: (bool? value) {
                          setState(() {
                            dresses = value! ? 1 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('11-15kg:'),
                      const Spacer(),
                      Checkbox(
                        value: pants > 0,
                        onChanged: (bool? value) {
                          setState(() {
                            pants = value! ? 1 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('16-20kg:'),
                      const Spacer(),
                      Checkbox(
                        value: shorts > 0,
                        onChanged: (bool? value) {
                          setState(() {
                            shorts = value! ? 1 : 0;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Laundry Preferences:',
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
            const SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  selectTime()
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
              child: const Row(
                children: [
                  Text(
                    'Delivery Fee',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '₱45.00',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
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
                  Text(
                    'Total Amount: ₱${calculateTotalPrice().toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0E5C46),
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Invoice(userProfile: widget.userProfile)
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Review payment and address',
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
              time: pickupTime[index], isPressed: dateIndex == index),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 16.h,
        ),
        itemCount: pickupTime.length,
      ),
    );
  }
}
