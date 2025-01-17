import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String user_id; 
  
  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phoneNumber;

  @HiveField(4)
  final String password;

  UserModel({
    required this.user_id, 
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  UserModel copyWith({
    String? user_id,
    String? name,
    String? email,
    String? phoneNumber,
    String? password,
  }) {
    return UserModel(
      user_id : user_id ?? this.user_id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }
}
