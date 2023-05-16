import 'package:meta/meta.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'package:tools/json.dart';

/// MongoDB中，collection中的一份记录
abstract class Document implements Selectable, Serializable {}

/// 描述如何在数据库中找到自己，主要供collection使用
abstract class Selectable {
  @protected
  SelectorBuilder get defaultSelector;
}

/// 主要用于@JsonSerializable()，如果implement了，就不会忘记这件事
abstract class Serializable {
  Json toJson();
}
