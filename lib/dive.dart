import 'package:tools/parser.dart';

/// 下潜[Dive]
///
/// 代表要采集珍珠草时的行动
/// 也代表现实生活中，完成任务时所要进入的心流状态
class Dive {
  final DateTime begin;
  final DateTime end;
  Dive({required this.begin, required this.end});
}

class DiveParser extends Parser<Dive> {
  @override
  Dive fromMap(Map map) {
    return Dive(
      begin: DateTime.parse(map["begin"]),
      end: DateTime.parse(map["end"]),
    );
  }

  @override
  Map toMap(Dive dive) => {
        "begin": dive.begin.toIso8601String(),
        "end": dive.end.toIso8601String(),
      };
}
