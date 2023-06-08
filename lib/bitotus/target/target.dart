import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tools/generator.dart';
import 'package:tools/json.dart';

import '../dive/dive.dart';

part 'target.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class Target extends HiveObject implements Jsonable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String caption;

  /// active, dropped, done
  @HiveField(3)
  String state;

  @HiveField(4)
  List<Dive> dives;

  /// 在这个任务上总共投入的时间
  Duration get totalTime {
    var output = Duration.zero;
    for (final dive in dives) {
      output += dive.duration;
    }
    return output;
  }

  Target({
    required this.id,
    required this.name,
    required this.caption,
    required this.state,
    required this.dives,
  });

  Target.create({required this.name})
      : id = Generator.id(),
        caption = "",
        state = "active",
        dives = [];

  @override
  Json toJson() => _$TargetToJson(this);
  factory Target.fromJson(Json json) => _$TargetFromJson(json);
}
