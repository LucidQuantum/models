import 'package:json_annotation/json_annotation.dart';
import 'package:tools/json.dart';
import 'package:models/serializable.dart';
import 'package:tools/generator.dart';

part 'sms.g.dart';

@JsonSerializable()
class Sms extends Serializable {
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
}
