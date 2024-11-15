import 'package:hive_flutter/hive_flutter.dart';

import '../models/inc_exp.dart';

class IncExpAdapter extends TypeAdapter<IncExp> {
  @override
  final typeId = 0;

  @override
  IncExp read(BinaryReader reader) {
    return IncExp(
      id: reader.read(),
      amount: reader.read(),
      title: reader.read(),
      category: reader.read(),
      isIncome: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, IncExp obj) {
    writer.write(obj.id);
    writer.write(obj.amount);
    writer.write(obj.title);
    writer.write(obj.category);
    writer.write(obj.isIncome);
  }
}
