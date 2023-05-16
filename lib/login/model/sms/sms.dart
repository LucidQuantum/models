import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:models/json.dart';
import 'package:models/serializable.dart';
import 'package:tools/generator.dart';


// part 'sms.g.dart';

// @JsonSerializable()
// class Sms extends Serializable {
//   static const expireTime = Duration(minutes: 15);

//   final Phone phone;
//   final String code;
//   final DateTime createAt;
//   bool valid;

//   Sms(
//       {required this.phone,
//       required this.code,
//       required this.createAt,
//       required this.valid}) {
//     final RegExp pattern = RegExp(r'^\d{4}$');
//     if (!pattern.hasMatch(code)) throw WebSocketException("错误的短信验证码格式，应为4位数字");
//   }

//   factory Sms.create(Phone phone) => Sms(
//         phone: phone,
//         code: Generator.smsCode(),
//         createAt: DateTime.now(),
//         valid: true,
//       );

//   Json toJson() => _$SmsToJson(this);
//   factory Sms.fromJson(Json json) => _$SmsFromJson(json);
// }
