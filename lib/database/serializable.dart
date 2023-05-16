import 'package:tools/json.dart';

/// 主要用于@JsonSerializable()，如果implement了，就不会忘记这件事
abstract class Serializable {
  Json toJson();
}
