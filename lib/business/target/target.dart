import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';
import 'package:tools/generator.dart';

import '../../database/document.dart';

part 'target.g.dart';

/// 目标[Target]
///
/// 现实：想去做的事
/// 深海蛋：采集珍珠草时要确定的方位
@JsonSerializable()
class Target implements TrackableDocument {
  final String id;
  final String userId;
  @override
  DateTime lastModified;
  String name;
  String caption;
  OrientState state;

  Target({
    required this.id,
    required this.userId,
    required this.name,
    required this.caption,
    required this.state,
    required this.lastModified,
  });

  Target.create({
    required this.name,
    required this.userId,
  })  : id = Generator.id(),
        caption = "",
        lastModified = DateTime.now(),
        state = OrientState.active;

  factory Target.fromJson(Json json) => _$TargetFromJson(json);
  Json toJson() => _$TargetToJson(this);

  @override
  late Map<String, dynamic> finder = {"id": id};
}

enum OrientState { active, discarded, completed }
