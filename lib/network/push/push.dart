import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';

import '../operation/operation.dart';

part 'push.g.dart';

/// 由服务端向客户端推送一些数据
/// 通常是一种操作，比如指导客户端执行一些操作（Consume）
/// 客户端执行完成后，需要给予服务端反馈
@JsonSerializable()
class Push {
  final String id;
  final List<Operation> operation;

  const Push({required this.id, required this.operation});

  factory Push.fromJson(Json json) => _$PushFromJson(json);
  Json toJson() => _$PushToJson(this);
}
