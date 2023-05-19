import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';

part 'operation.g.dart';

/// 定义了一个操作需要做的事情（比如添加定向、添加潜水等，每一件事都有特定的处理方式）
@JsonSerializable()
class Operation {
  final String id;
  final String previousOperationId;
  final OperationModel model;
  final OperationType type;
  final Map<String, dynamic> data;

  Operation({
    required this.id,
    required this.previousOperationId,
    required this.model,
    required this.type,
    required this.data,
  });

  factory Operation.fromJson(Json json) => _$OperationFromJson(json);
  Json toJson() => _$OperationToJson(this);
}

enum OperationType { create, update, delete }

enum OperationModel { user, target, dive }
