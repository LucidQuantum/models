import 'package:hive/hive.dart';

part 'current_target.g.dart';

@HiveType(typeId: 5)
class CurrentTarget extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime startTime;

  CurrentTarget({
    required this.id,
    required this.startTime,
  });
}
