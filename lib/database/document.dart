import 'package:tools/json.dart';

abstract class TrackableDocument implements Document, Trackable {}

/// MongoDB中，collection中的一份记录
abstract class Document implements Findable, Serializable {}

/// 主要用于@JsonSerializable()，如果implement了，就不会忘记这件事
abstract class Serializable {
  Json toJson();
}

abstract class Findable {
  /// 在数据库中查找它的方法
  /// Map的key指的是序列化后的key，value指的是它应该要匹配的值
  Map<String, dynamic> get finder;
}

abstract class Trackable {
  /// 能够追踪上次修改时间，以免错误的修改
  DateTime get lastModified;
  set lastModified(DateTime time);
}
