// ignore_for_file: invalid_use_of_protected_member

import 'package:meta/meta.dart';
import 'package:models/database/document.dart';
import 'package:mongo_dart/mongo_dart.dart';

/// 使用base class而不是用extension的形式，主要是可以对document的形式稍微有一些约束
/// 比如说，就可以防止User model不小心插入到Sms collection中
abstract class BaseCollection<T extends Document> {
  @protected
  final DbCollection collection;

  BaseCollection(this.collection);

  Future insert(T item) async {
    await collection.insert(item.toJson());
  }

  Future update(T item) async {
    await collection.updateOne(item.defaultSelector, {"\$set": item.toJson()});
  }
}
