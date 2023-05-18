import 'package:json_annotation/json_annotation.dart';
import 'package:models/database/document.dart';
import 'package:models/dive/dive.dart';
import 'package:mongo_dart_query/mongo_dart_query.dart';
import 'package:tools/json.dart';
import 'package:tools/generator.dart';

import '../target/target.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements Document {
  final String id;
  String phone;
  List<Target> orients;

  @JsonKey(includeFromJson: true, includeToJson: true)
  int? _currentOrientIndex;
  Target? get currentOrient =>
      _currentOrientIndex != null ? orients[_currentOrientIndex!] : null;

  DateTime? startTime;

  User({required this.id, required this.phone, required this.orients});

  factory User.fromJson(Json json) => _$UserFromJson(json);
  Json toJson() => _$UserToJson(this);

  factory User.create(String phone) => User(
        id: Generator.id(),
        phone: phone,
        orients: [],
      );

  Target createOrient(String name) {
    final orient = Target.create(name);
    orients.add(orient);
    return orient;
  }

  startDive(Target orient) {
    assert(_currentOrientIndex == null && startTime == null);
    // 记录orient和当前时间
    startTime = DateTime.now();
    _currentOrientIndex = orients.indexOf(orient);
  }

  finishDive() {
    assert(_currentOrientIndex != null && startTime != null);
    // 在当前orient中加入一个Dive
    final dive = Dive(begin: startTime!, end: DateTime.now());
    currentOrient!.dives.add(dive);

    // 清除当前信息
    _currentOrientIndex = null;
    startTime = null;
  }

  @override
  SelectorBuilder get defaultSelector => where.eq("id", id);
}
