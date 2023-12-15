import 'package:hive/hive.dart';

part 'order_model.g.dart'; 

@HiveType(typeId: 1)
class OrderModel{

  @HiveField(0)
  final bool status; 

  @HiveField(1)
  final String orderType; 

  @HiveField(2)
  final BigInt custID; 

  @HiveField(3)
  final String provID; 

  @HiveField(4)
  final double price; 

  @HiveField(5)
  final String address; 

  @HiveField(6)
  final List<String> preference; 

  @HiveField(7)
  final String shopImage; 

  @HiveField(8)
  final DateTime orderdate;

  OrderModel({
  required this.status,
  required this.orderType,
  required this.custID, 
  required this.provID,
  required this.price,
  required this.address,
  required this.preference,
  required this.shopImage, 
  required this.orderdate,
  });

OrderModel copyWith({
  bool? status, 
  String? orderType, 
  BigInt? custID,
  String? provID,
  double? price,
  String? address,
  List<String>? preference, 
  String? shopImage,
  DateTime? orderdate, 
}){
  return OrderModel(
    status: status ?? this.status,
    orderType: orderType ?? this.orderType,
    custID: custID ?? this.custID,
    provID: provID ?? this.provID,
    price: price ?? this.price,
    address: address ?? this.address,
    preference: preference ?? this.preference,
    shopImage: shopImage ?? this.shopImage,
    orderdate: orderdate ?? this.orderdate, 
  );
}

}
