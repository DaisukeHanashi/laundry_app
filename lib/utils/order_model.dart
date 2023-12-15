import 'package:hive/hive.dart';

import 'user_model.dart'; 
part 'order_model.g.dart'; 

@HiveType(typeId: 1)
class OrderModel{

  @HiveField(0)
  final bool status; 

  @HiveField(1)
  final BigInt custID; 

  @HiveField(2)
  final String provID; 

  @HiveField(3)
  final double price; 

  @HiveField(4)
  final String address; 

  @HiveField(5)
  final String preference; 

  OrderModel({
  required this.status,
  required this.custID, 
  required this.provID,
  required this.price,
  required this.address,
  required this.preference,
  });

OrderModel copyWith({
  bool? status, 
  BigInt? custID,
  String? provID,
  double? price,
  String? address,
  String? preference, 
}){
  return OrderModel(
    status: status ?? this.status,
    custID: custID ?? this.custID,
    provID: provID ?? this.provID,
    price: price ?? this.price,
    address: address ?? this.address,
    preference: preference ?? this.preference,
  );
}

}
