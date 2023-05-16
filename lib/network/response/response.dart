import 'package:json_annotation/json_annotation.dart';
import 'package:models/serializable.dart';

part 'response.g.dart';

@JsonSerializable()
class Response implements Serializable {
  final String? id;
  final bool success;
  final dynamic message;
  final Map<String, dynamic>? data;

  const Response({this.id, required this.success, this.message, this.data});

  factory Response.refuse(
          {String? id, required String message, Map<String, dynamic>? data}) =>
      Response(id: id, success: false, message: message, data: data);

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
