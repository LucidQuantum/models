import 'package:meta/meta.dart';
import 'package:tools/json.dart';

import 'document.dart';

/// DAO为Data Access Object（数据访问对象）的通用简称
/// 意思就是基本的增删改查interface
abstract class BaseDAO<T extends Document> {
  /// 在findOne时无法反序列化，所以需要指定这个function来构建Object
  @protected
  T Function(Json json) get fromJson;

  Future insert(T item);
  Future<T?> findOne(Map<String, dynamic> query);
  Future update(T item);
  Future delete(T item);
}
