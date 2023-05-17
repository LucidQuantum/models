import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';

import '../../database/document.dart';

part 'response.g.dart';

@JsonSerializable()
class Response implements Serializable {
  /// 如果有id，通常是回复某一个具体的请求
  String? id;
  final bool accept;
  final dynamic message;
  final Json? data;

  Response({this.id, required this.accept, this.message, this.data});

  factory Response.refuse(String message, {String? id, Json? data}) =>
      Response(id: id, accept: false, message: message, data: data);

  factory Response.fromJson(Json json) => _$ResponseFromJson(json);
  Json toJson() => _$ResponseToJson(this);
}
