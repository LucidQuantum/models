import 'package:json_annotation/json_annotation.dart';

import '../dive/dive.dart';

part 'orient.g.dart';

/// 定向[Orient]
///
/// 代表深海蛋中采集珍珠草时要确定的一个方向
/// 也代表现实生活中，要工作之前，先确定的目标
@JsonSerializable()
class Orient {
  final String id;
  String title;
  String caption;
  final List<Dive> dives;
  OrientState state;

  Orient({
    required this.id,
    required this.title,
    required this.caption,
    required this.dives,
    required this.state,
  });

  factory Orient.fromJson(Map<String, dynamic> json) => _$OrientFromJson(json);

  Map<String, dynamic> toJson() => _$OrientToJson(this);
}

enum OrientState { active, discarded, completed }
