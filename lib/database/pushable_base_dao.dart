import 'package:models/network/network.dart';
import 'package:tools/json.dart';

import 'base_dao.dart';
import 'document.dart';

class PushableBaseDAO<T extends TrackableDocument> implements BaseDAO<T> {
  final BaseDAO<T> _dao;
  final OperationModel model;

  PushableBaseDAO(this._dao, {required this.model});

  @override
  T Function(Json json) get unserialize => _dao.unserialize;

  @override
  Future<Operation> insert(T item) async {
    // 生成Operation
    final operation = _generateOperation(OperationType.insert, item);
    // 绑定修改时间
    item.lastModified = operation.createTime;
    // 操作
    await _dao.insert(item);
    return operation;
  }

  @override
  Future<T?> findOne(Map<String, dynamic> query) {
    return _dao.findOne(query);
  }

  @override
  Future<T> findOneOrThrow(Map<String, dynamic> query) {
    return _dao.findOneOrThrow(query);
  }

  @override
  Future<Operation> update(T item) async {
    // 生成Operation
    final operation = _generateOperation(OperationType.update, item);
    // 绑定修改时间
    item.lastModified = operation.createTime;
    // 操作
    await _dao.update(item);

    return operation;
  }

  @override
  Future<Operation> delete(T item) async {
    // 生成Operation
    final operation = _generateOperation(OperationType.delete, item);
    // 绑定修改时间
    item.lastModified = operation.createTime;
    // 操作
    await _dao.delete(item);
    return operation;
  }

  Operation _generateOperation(OperationType type, T item) => Operation(
        createTime: DateTime.now(),
        lastOperationTime: item.lastModified,
        model: model,
        type: type,
        data: item.toJson(),
      );
}
