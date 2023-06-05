import 'package:hive/hive.dart';

part 'dive.g.dart';

@HiveType(typeId: 4)
class Dive extends HiveObject {
  @HiveField(0)
  final DateTime begin;

  @HiveField(1)
  final DateTime end;

  Dive({
    required this.begin,
    required this.end,
  });
}
