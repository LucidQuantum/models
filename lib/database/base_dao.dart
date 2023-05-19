import 'package:meta/meta.dart';
import 'package:tools/error_handling/app_error.dart';
import 'package:tools/json.dart';

import 'document.dart';

/// DAO为Data Access Object（数据访问对象）的通用简称
/// 意思就是基本的增删改查interface
abstract class BaseDAO<T extends Document> {
  /// 在findOne时无法反序列化，所以需要指定这个function来构建Object
  @protected
  T Function(Json json) get unserialize;

  Future insert(T item);
  Future<T?> findOne(Map<String, dynamic> query);
  Future<T> findOneOrThrow(Map<String, dynamic> query) async {
    final T? item = await findOne(query);
    if (item == null) throw AppError("没有根据query找到对应的目标：$query");
    return item;
  }

  Future update(T item);
  Future delete(T item);
}
