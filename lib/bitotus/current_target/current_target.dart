import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';

part 'current_target.g.dart';

@JsonSerializable()
@HiveType(typeId: 5)
class CurrentTarget extends HiveObject implements Jsonable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime startTime;

  CurrentTarget({
    required this.id,
    required this.startTime,
  });

  @override
  Json toJson() => _$CurrentTargetToJson(this);
  factory CurrentTarget.fromJson(Json json) => _$CurrentTargetFromJson(json);
}
