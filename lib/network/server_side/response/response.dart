import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';

import '../../../database/document.dart';

part 'response.g.dart';

@JsonSerializable()
class Response implements Serializable {
  /// 如果有id，通常是回复某一个具体的请求
  String? id;
  final bool accept;
  final String? message;
  final Json? data;

  Response({this.id, required this.accept, this.message, this.data});

  factory Response.refuse(String message, {Json? data}) =>
      Response(accept: false, message: message, data: data);
  factory Response.accept() => Response(accept: true);

  factory Response.fromJson(Json json) => _$ResponseFromJson(json);
  Json toJson() => _$ResponseToJson(this);
}

/// 一般登录时才会发送数据
class Accept extends Response {
  Accept({Json? data}) : super(accept: true, data: data);
}

class Refuse extends Response {
  Refuse(String message) : super(accept: false, message: message);
}
