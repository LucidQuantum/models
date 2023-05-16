import 'package:json_annotation/json_annotation.dart';
import 'package:models/serializable.dart';

import '../../json.dart';

part 'response.g.dart';

@JsonSerializable()
class Response implements Serializable {
  final bool success;
  final dynamic message;
  final Json? data;

  const Response({required this.success, this.message, this.data});

  factory Response.refuse(String message, {Json? data}) =>
      Response(success: false, message: message, data: data);

  factory Response.fromJson(Json json) => _$ResponseFromJson(json);
  Json toJson() => _$ResponseToJson(this);
}
