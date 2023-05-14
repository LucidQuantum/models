import 'package:json_annotation/json_annotation.dart';
import 'package:models/dive/dive.dart';
import 'package:models/orient/orient.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  String phone;
  List<Orient> orients;

  Orient? currentOrient;
  DateTime? startTime;

  User({required this.id, required this.phone, required this.orients});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  addOrient(String name) {
    final orient = Orient.create(name);
    orients.add(orient);
  }

  startDive(Orient orient) {
    assert(currentOrient == null && startTime == null);
    // 记录orient和当前时间
    startTime = DateTime.now();
    currentOrient = orient;
  }

  finishDive() {
    assert(currentOrient != null && startTime != null);
    // 在当前orient中加入一个Dive
    final dive = Dive(begin: startTime!, end: DateTime.now());
    currentOrient!.dives.add(dive);

    // 清除当前信息
    currentOrient = null;
    startTime = null;
  }
}
