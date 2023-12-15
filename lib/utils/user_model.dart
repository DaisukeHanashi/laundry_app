import 'package:hive/hive.dart';
import 'dart:math'; 
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final BigInt user_id; 
  
  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phoneNumber;

  @HiveField(4)
  final String password;

  UserModel({
    BigInt? user_id, 
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  }): user_id = user_id ?? _generateRandomUserId();

  static BigInt _generateRandomUserId() {
    final random = Random();
    // You can adjust the number of bits based on your requirements
    final randomBits = List.generate(128, (_) => random.nextInt(2)).join('');
    return BigInt.parse(randomBits, radix: 2);
  }

  UserModel copyWith({
    BigInt? user_id,
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
