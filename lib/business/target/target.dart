import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';
import 'package:tools/generator.dart';

import 'package:models/business/business.dart';
import '../../database/document.dart';
import '../dive/dive.dart';

part 'target.g.dart';

/// 目标[Target]
///
/// 现实：想去做的事
/// 深海蛋：采集珍珠草时要确定的方位
@JsonSerializable()
class Target implements Serializable {
  final String id;
  String name;
  String caption;
  final List<Dive> dives;
  OrientState state;

  Target({
    required this.id,
    required this.name,
    required this.caption,
    required this.dives,
    required this.state,
  });

  factory Target.create(String name) {
    return Target(
      id: Generator.id(),
      name: name,
      caption: "",
      dives: [],
      state: OrientState.active,
    );
  }

  factory Target.fromJson(Json json) => _$TargetFromJson(json);
  Json toJson() => _$TargetToJson(this);
}

enum OrientState { active, discarded, completed }
