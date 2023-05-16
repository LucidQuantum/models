import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';
import 'package:models/database/serializable.dart';

part 'response.g.dart';

@JsonSerializable()
class Response implements Serializable {
  String? id;
  final bool success;
  final dynamic message;
  final Json? data;

  Response({this.id, required this.success, this.message, this.data});

  factory Response.refuse(String message, {String? id, Json? data}) =>
      Response(id: id, success: false, message: message, data: data);

  factory Response.fromJson(Json json) => _$ResponseFromJson(json);
  Json toJson() => _$ResponseToJson(this);
}
