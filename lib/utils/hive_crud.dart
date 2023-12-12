import 'package:hive/hive.dart';
import '../utils/user_model.dart';

class HiveCRUD {
  static const String boxName = 'users';

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
}
