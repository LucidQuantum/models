import 'package:json_annotation/json_annotation.dart';
import 'package:models/database/document.dart';
import 'package:tools/json.dart';

part 'operation.g.dart';

/// 定义了一个操作需要做的事情（比如添加定向、添加潜水等，每一件事都有特定的处理方式）
///
/// 客户端那边会根据lastOperationTime来匹配操作，以免顺序搞乱，操作完成后，会将createTime更新、覆盖为lastOperationTime
@JsonSerializable()
class Operation implements Serializable {
  final DateTime createTime;
  final DateTime lastOperationTime;
  final OperationModel model;
  final OperationType type;
  final Json data;

  Operation({
    required this.createTime,
    required this.lastOperationTime,
    required this.model,
    required this.type,
    required this.data,
  });

  factory Operation.fromJson(Json json) => _$OperationFromJson(json);
  Json toJson() => _$OperationToJson(this);
}

enum OperationType { insert, create, update, delete }

enum OperationModel { user, target, dive }
