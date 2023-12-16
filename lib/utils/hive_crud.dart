import 'dart:js_interop';

import 'package:hive/hive.dart';
import '../utils/user_model.dart';
import '../utils/order_model.dart'; 

abstract class HiveCRUD implements HiveInterface{
  static const String boxName = 'users';
  static const String orderName = 'orders'; 

  static Future<void> addUser(UserModel user) async {
    final userBox = await Hive.openBox<UserModel>(boxName);
    await userBox.put(user.user_id, user);
    await userBox.close();
  }

  
  static Future<List<UserModel>> getUsers() async {
    final userBox = await Hive.openBox<UserModel>(boxName);
    final userList = userBox.values.toList();
    await userBox.close();
    return userList;
  }

  
  static Future<void> updateUser(String index, UserModel updatedUser) async {
    final userBox = await Hive.openBox<UserModel>(boxName);
    await userBox.put(index.toString(), updatedUser);
    await userBox.close();
  }

 
  static Future<void> deleteUser(String index) async {
    final userBox = await Hive.openBox<UserModel>(boxName);
    await userBox.delete(index);
    await userBox.close();
  }
   static Future<void> saveUsers(List<UserModel> users) async {
    final box = await Hive.openBox<UserModel>(boxName);
    await box.clear(); 
    await box.addAll(users); 
  }
 
static Future<void> addOrder(OrderModel order) async{
  final orderBox = await Hive.openBox<OrderModel>(orderName); 
  await orderBox.put(order.orderID, order); 
  await orderBox.close(); 
}

static Future<List<OrderModel>> getOrders(String customer) async{
   final orderBox = await Hive.openBox<OrderModel>(orderName);
   final orderList = orderBox.values
      .where((order) => order.custID == customer)
      .toList(growable: true);
    await orderBox.close();
    return orderList;
}

static Future<void> updateOrder(String orderID, OrderModel updatedOrder) async {
  final orderBox = await Hive.openBox<OrderModel>(orderName);
  await orderBox.put(orderID, updatedOrder);
  await orderBox.close();
}
 static Future<void> deleteOrder(String orderID) async {
    final orderBox = await Hive.openBox<OrderModel>(orderName);
    await orderBox.delete(orderID);
    await orderBox.close();
  }
}
