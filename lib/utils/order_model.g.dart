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
      orderID: fields[0] as String,
      status: fields[1] as int,
      orderType: fields[2] as String,
      custID: fields[3] as String,
      provID: fields[4] as String,
      price: fields[5] as double,
      address: fields[6] as String,
      preference: (fields[7] as List).cast<String>(),
      shopImage: fields[8] as String,
      orderdate: fields[9] as DateTime,
      pickupTime: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.orderID.toString())
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.orderType)
      ..writeByte(3)
      ..write(obj.custID)
      ..writeByte(4)
      ..write(obj.provID)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.preference)
      ..writeByte(8)
      ..write(obj.shopImage)
      ..writeByte(9)
      ..write(obj.orderdate)
      ..writeByte(10)
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
