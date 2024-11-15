import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class IncExp {
  IncExp({
    required this.id,
    required this.amount,
    required this.title,
    required this.category,
    required this.isIncome,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  int amount;
  @HiveField(2)
  String title;
  @HiveField(3)
  String category;
  @HiveField(3)
  bool isIncome;
}
