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
     custID: fields[1] as BigInt,
     provID: fields[2] as String,
     price: fields[3] as double, 
     address: fields[4] as String,
     preference: fields[5] as String, 
    );
    }

  @override
  void write(BinaryWriter writer, OrderModel order){
    writer
    ..writeByte(0)
    ..write(order.status)
    ..writeByte(1)
    ..write(order.custID)
    ..writeByte(2)
    ..write(order.provID)
    ..writeByte(3)
    ..write(order.price)
    ..writeByte(4)
    ..write(order.address)
    ..writeByte(5)
    ..write(order.preference); 

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