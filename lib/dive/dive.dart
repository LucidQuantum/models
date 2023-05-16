import 'package:json_annotation/json_annotation.dart';

import 'package:tools/json.dart';
import '../serializable.dart';

part 'dive.g.dart';

/// 下潜[Dive]
///
/// 代表要采集珍珠草时的行动
/// 也代表现实生活中，完成任务时所要进入的心流状态
@JsonSerializable()
class Dive implements Serializable {
  final DateTime begin;
  final DateTime end;
  Dive({required this.begin, required this.end});

  factory Dive.fromJson(Json json) => _$DiveFromJson(json);
  Json toJson() => _$DiveToJson(this);
}
