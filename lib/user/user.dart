import 'package:json_annotation/json_annotation.dart';
import 'package:models/dive/dive.dart';
import 'package:tools/json.dart';
import 'package:models/orient/orient.dart';
import 'package:tools/generator.dart';

import '../serializable.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements Serializable {
  final String id;
  String phone;
  List<Orient> orients;

  @JsonKey(includeFromJson: true, includeToJson: true)
  int? _currentOrientIndex;
  Orient? get currentOrient =>
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

  Orient createOrient(String name) {
    final orient = Orient.create(name);
    orients.add(orient);
    return orient;
  }

  startDive(Orient orient) {
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
}
