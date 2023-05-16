import 'package:meta/meta.dart';
import 'package:mongo_dart/mongo_dart.dart';

/// 描述如何在数据库中找到自己，主要供collection使用
abstract class Selectable {
  @protected
  SelectorBuilder get defaultSelector;
}
