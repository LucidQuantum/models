import 'package:json_annotation/json_annotation.dart';
import 'package:tools/generator.dart';

import 'package:tools/json.dart';

import '../../database/document.dart';

part 'dive.g.dart';

/// 下潜[Dive]
///
/// 代表要采集珍珠草时的行动
/// 也代表现实生活中，完成任务时所要进入的心流状态
@JsonSerializable()
class Dive implements Document {
  final String id;
  final String targetId;
  final DateTime begin;
  final DateTime? end;
  Dive({
    required this.id,
    required this.targetId,
    required this.begin,
    required this.end,
  });

  Dive.create({
    required this.targetId,
    required this.begin,
    required this.end,
  }) : id = Generator.id();

  factory Dive.fromJson(Json json) => _$DiveFromJson(json);
  Json toJson() => _$DiveToJson(this);

  @override
  late Map<String, dynamic> finder = {"id": id};
}
