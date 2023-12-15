part of 'order_model.dart';


class OrderModelAdapter extends TypeAdapter<OrderModel>{
  @override
  final int typeId = 1; 

  @override
  OrderModel read(BinaryReader br){
    final fieldSize = br.readByte(); 
    final fields = <int, dynamic>{
    for (int i = 0; i < fieldSize; i++) br.readByte() : br.read(),
    }; 
     return OrderModel(
     status: fields[0] as bool,
     orderType: fields[1] as String,
     custID: fields[2] as BigInt,
     provID: fields[3] as String,
     price: fields[4] as double, 
     address: fields[5] as String,
     preference: fields[6] as List<String>, 
     shopImage: fields[7] as String,
     orderdate: fields[8] as DateTime,
    );
    }

  @override
  void write(BinaryWriter writer, OrderModel order){
    writer
    ..writeByte(0)
    ..write(order.status)
    ..writeByte(1)
    ..write(order.orderType)
    ..writeByte(2)
    ..write(order.custID)
    ..writeByte(3)
    ..write(order.provID)
    ..writeByte(4)
    ..write(order.price)
    ..writeByte(5)
    ..write(order.address)
    ..writeByte(6)
    ..write(order.preference)
    ..writeByte(7)
    ..write(order.shopImage)
    ..writeByte(8)
    ..write(order.orderdate);

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