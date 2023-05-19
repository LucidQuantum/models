import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';

part 'current_target.g.dart';

@JsonSerializable()
class CurrentTarget {
  final String id;
  final DateTime startTime;

  const CurrentTarget({
    required this.id,
    required this.startTime,
  });

  factory CurrentTarget.fromJson(Json json) => _$CurrentTargetFromJson(json);
  Json toJson() => _$CurrentTargetToJson(this);
}
