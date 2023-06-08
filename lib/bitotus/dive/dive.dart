import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';

part 'dive.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class Dive extends HiveObject implements Jsonable {
  @HiveField(0)
  final DateTime begin;

  @HiveField(1)
  final DateTime end;

  /// 计算当前dive一共经过了多久
  Duration get duration => end.difference(begin);

  Dive({
    required this.begin,
    required this.end,
  });

  @override
  Json toJson() => _$DiveToJson(this);
  factory Dive.fromJson(Json json) => _$DiveFromJson(json);
}
