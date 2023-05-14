import 'package:tools/parser.dart';

import 'dive.dart';

/// 定向[Orient]
///
/// 代表深海蛋中采集珍珠草时要确定的一个方向
/// 也代表现实生活中，要工作之前，先确定的目标
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
}

class OrientParser extends Parser<Orient> {
  static final diveParser = DiveParser();

  @override
  Orient fromMap(Map map) {
    List<Dive> dives = (map["dives"] as List)
        .map((diveMap) => diveParser.fromMap(map))
        .toList();

    return Orient(
      id: map["id"],
      title: map["title"],
      caption: map["caption"],
      dives: dives,
      state: map["state"],
    );
  }

  @override
  Map toMap(Orient orient) {
    return {
      "id": orient.id,
      "title": orient.title,
      "caption": orient.caption,
      "dives": orient.dives.map((dive) => diveParser.toMap(dive)).toList(),
      "state": orient.state.index,
    };
  }
}

enum OrientState { active, discarded, completed }
