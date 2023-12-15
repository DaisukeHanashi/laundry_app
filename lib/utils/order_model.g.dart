// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 105;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      status: fields[0] as int,
      orderType: fields[1] as String,
      custID: fields[2] as BigInt,
      provID: fields[3] as String,
      price: fields[4] as double,
      address: fields[5] as String,
      preference: (fields[6] as List).cast<String>(),
      shopImage: fields[7] as String,
      orderdate: fields[8] as DateTime,
      pickupTime: fields[9] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.orderType)
      ..writeByte(2)
      ..write(obj.custID)
      ..writeByte(3)
      ..write(obj.provID)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.preference)
      ..writeByte(7)
      ..write(obj.shopImage)
      ..writeByte(8)
      ..write(obj.orderdate)
      ..writeByte(9)
      ..write(obj.pickupTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
