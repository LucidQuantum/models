import 'package:hive/hive.dart';
import 'package:tools/generator.dart';

import '../dive/dive.dart';

part 'target.g.dart';

@HiveType(typeId: 3)
class Target extends HiveObject {
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
}
