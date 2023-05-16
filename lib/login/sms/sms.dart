import 'package:json_annotation/json_annotation.dart';
import 'package:mongo_dart_query/mongo_dart_query.dart';
import 'package:tools/json.dart';
import 'package:tools/generator.dart';

import '../../database/document.dart';

part 'sms.g.dart';

@JsonSerializable()
class Sms implements Document {
  final String phone;
  final String code;
  final DateTime createAt;
  bool valid;

  Sms({
    required this.phone,
    required this.code,
    required this.createAt,
    required this.valid,
  });

  factory Sms.create(String phone) => Sms(
        phone: phone,
        code: Generator.smsCode(),
        createAt: DateTime.now(),
        valid: true,
      );

  Json toJson() => _$SmsToJson(this);
  factory Sms.fromJson(Json json) => _$SmsFromJson(json);

  @override
  SelectorBuilder get defaultSelector =>
      where.eq("phone", phone).eq("code", code);
}
