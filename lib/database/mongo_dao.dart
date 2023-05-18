// ignore_for_file: invalid_use_of_protected_member

import 'package:meta/meta.dart';
import 'package:models/database/base_dao.dart';
import 'package:models/database/document.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:tools/json.dart';

/// 使用base class而不是用extension的形式，主要是可以对document的形式稍微有一些约束
/// 比如说，就可以防止User model不小心插入到Sms collection中
abstract class MongoDAO<T extends Document> extends BaseDAO<T> {
  @protected
  DbCollection get collection;

  @override
  Future insert(T item) async {
    await collection.insert(item.toJson());
  }

  @override
  Future update(T item) async {
    final selector = item.finder.toSelector();
    await collection.updateOne(selector, {"\$set": item.toJson()});
  }

  @override
  Future delete(T item) async {
    final selector = item.finder.toSelector();
    await collection.deleteOne(selector);
  }

  @override
  Future<T?> findOne(Map<String, dynamic> query) async {
    final selector = query.toSelector();
    final Json? result = await collection.findOne(selector);
    if (result == null) return null;
    return fromJson(result);
  }
}

extension _ToSelectorExtension on Map<String, dynamic> {
  SelectorBuilder toSelector() {
    final selector = SelectorBuilder();
    entries.forEach((entry) {
      selector.eq(entry.key, entry.value);
    });
    return selector;
  }
}
