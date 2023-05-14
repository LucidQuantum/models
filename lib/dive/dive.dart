import 'package:json_annotation/json_annotation.dart';

part 'dive.g.dart';

/// 下潜[Dive]
///
/// 代表要采集珍珠草时的行动
/// 也代表现实生活中，完成任务时所要进入的心流状态
@JsonSerializable()
class Dive {
  final DateTime begin;
  final DateTime end;
  Dive({required this.begin, required this.end});

  factory Dive.fromJson(Map<String, dynamic> json) => _$DiveFromJson(json);
  Map<String, dynamic> toJson() => _$DiveToJson(this);
}
