import 'package:json_annotation/json_annotation.dart';
import 'package:models/database/document.dart';
import 'package:models/dive/dive.dart';
import 'package:mongo_dart_query/mongo_dart_query.dart';
import 'package:tools/error_handling/app_error.dart';
import 'package:tools/json.dart';
import 'package:tools/generator.dart';

import '../target/target.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements Document {
  final String id;
  String phone;
  List<Target> targets;

  @JsonKey(includeFromJson: true, includeToJson: true)
  int? _DivingTargetIndex;
  Target? get divingTarget =>
      _DivingTargetIndex != null ? targets[_DivingTargetIndex!] : null;

  DateTime? startTime;

  User({required this.id, required this.phone, required this.targets});

  factory User.fromJson(Json json) => _$UserFromJson(json);
  Json toJson() => _$UserToJson(this);

  factory User.create(String phone) => User(
        id: Generator.id(),
        phone: phone,
        targets: [],
      );

  Target? findTarget(String id) {
    for (final target in targets) {
      if (target.id == id) return target;
    }
    return null;
  }

  Target findTargetOrThrow(String id) {
    final target = findTarget(id);
    if (target == null) throw AppError("没有根据id：$id找到对应的目标");
    return target;
  }

  startDive(Target orient) {
    assert(_DivingTargetIndex == null && startTime == null);
    // 记录orient和当前时间
    startTime = DateTime.now();
    _DivingTargetIndex = targets.indexOf(orient);
  }

  finishDive() {
    assert(_DivingTargetIndex != null && startTime != null);
    // 在当前orient中加入一个Dive
    final dive = Dive(begin: startTime!, end: DateTime.now());
    divingTarget!.dives.add(dive);

    // 清除当前信息
    _DivingTargetIndex = null;
    startTime = null;
  }

  @override
  late Map<String, dynamic> finder = {
    "id": id,
  };
}
