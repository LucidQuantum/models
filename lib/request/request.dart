import 'package:json_annotation/json_annotation.dart';
import 'package:models/json.dart';
import 'package:models/serializable.dart';
import 'package:tools/generator.dart';

part 'request.g.dart';

/// 由客户端发给服务端，通常包含了所有请求所需要的信息
///
/// 用法是child class extend，child存在的意义是定义数据格式
@JsonSerializable()
class Request implements Serializable {
  final String id;
  final RequestType type;
  final Json? data;

  Request({required this.id, required this.type, this.data});
  Request.create(this.type, {required this.data}) : id = Generator.id();

  factory Request.fromJson(Json json) => _$RequestFromJson(json);
  Json toJson() => _$RequestToJson(this);
}

enum RequestType {
  sendSms(false),
  smsLogin(false),
  tokenLogin(false),
  createOrient(),
  startDive(),
  finishDive();

  final bool requireLogin;
  const RequestType([this.requireLogin = true]);
}
