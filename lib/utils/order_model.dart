import 'package:hive/hive.dart';

part 'order_model.g.dart'; 

@HiveType(typeId: 105)
class OrderModel{

  @HiveField(0)
   final String orderID; 

  @HiveField(1)
   int status; 

  @HiveField(2)
  final String orderType; 

  @HiveField(3)
  final String custID; 

  @HiveField(4)
  final String provID; 

  @HiveField(5)
  final double price; 

  @HiveField(6)
  final String address; 

  @HiveField(7)
  final List<String> preference; 

  @HiveField(8)
  final String shopImage; 

  @HiveField(9)
  final DateTime orderdate;

  @HiveField(10)
   DateTime pickupTime; 

  OrderModel({
  required this.orderID,
  required this.status,
  required this.orderType,
  required this.custID, 
  required this.provID,
  required this.price,
  required this.address,
  required this.preference,
  required this.shopImage, 
  required this.orderdate,
  required this.pickupTime,
  });

OrderModel copyWith({
  String? orderID,
  int? status, 
  String? orderType, 
  String? custID,
  String? provID,
  double? price,
  String? address,
  List<String>? preference, 
  String? shopImage,
  DateTime? orderdate, 
  DateTime? pickupTime,
}){
  return OrderModel(
    orderID: orderID ?? this.orderID,
    status: status ?? this.status,
    orderType: orderType ?? this.orderType,
    custID: custID ?? this.custID,
    provID: provID ?? this.provID,
    price: price ?? this.price,
    address: address ?? this.address,
    preference: preference ?? this.preference,
    shopImage: shopImage ?? this.shopImage,
    orderdate: orderdate ?? this.orderdate, 
    pickupTime: pickupTime ?? this.pickupTime
  );
}

}
