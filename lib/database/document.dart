import 'package:tools/json.dart';

/// MongoDB中，collection中的一份记录
abstract class Document implements Findable, Serializable {}

/// 主要用于@JsonSerializable()，如果implement了，就不会忘记这件事
abstract class Serializable {
  Json toJson();
}

/// 查找方法：
///
/// key指的是序列化后的key，value指的是它应该要匹配的值
abstract class Findable {
  Map<String, dynamic> get finder;
}
