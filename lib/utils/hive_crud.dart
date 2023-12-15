import 'package:hive/hive.dart';
import '../utils/user_model.dart';
import '../utils/order_model.dart'; 

class HiveCRUD {
  static const String boxName = 'users';
  static const String orderName = 'orders'; 

  static Future<void> addUser(UserModel user) async {
    final userBox = await Hive.openBox<UserModel>(boxName);
    await userBox.add(user);
    await userBox.close();
  }

  
  static Future<List<UserModel>> getUsers() async {
    final userBox = await Hive.openBox<UserModel>(boxName);
    final userList = userBox.values.toList();
    await userBox.close();
    return userList;
  }

  
  static Future<void> updateUser(int index, UserModel updatedUser) async {
    final userBox = await Hive.openBox<UserModel>(boxName);
    await userBox.putAt(index, updatedUser);
    await userBox.close();
  }

 
  static Future<void> deleteUser(int index) async {
    final userBox = await Hive.openBox<UserModel>(boxName);
    await userBox.deleteAt(index);
    await userBox.close();
  }
   static Future<void> saveUsers(List<UserModel> users) async {
    final box = await Hive.openBox<UserModel>(boxName);
    await box.clear(); 
    await box.addAll(users); 
  }
 
static Future<void> addOrder(OrderModel order) async{
  final orderBox = await Hive.openBox<OrderModel>(orderName); 
  await orderBox.add(order); 
  await orderBox.close(); 
}

static Future<List<OrderModel>> getOrders(BigInt customer) async{
   final orderBox = await Hive.openBox<OrderModel>(orderName);
   final orderList = orderBox.values
      .where((order) => order.custID == customer)
      .toList();

    await orderBox.close();
    return orderList;
}

static Future<void> updateOrder(int index, OrderModel updatedOrder) async{
   final orderBox = await Hive.openBox<OrderModel>(orderName); 
  await orderBox.put(index, updatedOrder); 
  await orderBox.close(); 
}
 static Future<void> deleteOrder(int index) async {
    final orderBox = await Hive.openBox<OrderModel>(orderName);
    await orderBox.deleteAt(index);
    await orderBox.close();
  }
}
