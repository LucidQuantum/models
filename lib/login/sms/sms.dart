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
  bool hasUsed;

  Sms({
    required this.phone,
    required this.code,
    required this.createAt,
    required this.hasUsed,
  });

  factory Sms.create(String phone) => Sms(
        phone: phone,
        code: Generator.smsCode(),
        createAt: DateTime.now(),
        hasUsed: false,
      );

  Json toJson() => _$SmsToJson(this);
  factory Sms.fromJson(Json json) => _$SmsFromJson(json);

  @override
  SelectorBuilder get defaultSelector =>
      where.eq("phone", phone).eq("code", code);
}

extension BoolExtension on Sms {
  /// 目前固定15分钟后过期
  bool get isExpire {
    Duration timeSinceCreated = DateTime.now().difference(createAt);
    final expireTime = Duration(minutes: 15);

    return timeSinceCreated > expireTime;
  }
}
