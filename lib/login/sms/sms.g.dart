// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sms _$SmsFromJson(Map<String, dynamic> json) => Sms(
      phone: json['phone'] as String,
      code: json['code'] as String,
      createAt: DateTime.parse(json['createAt'] as String),
      valid: json['valid'] as bool,
    );

Map<String, dynamic> _$SmsToJson(Sms instance) => <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
      'createAt': instance.createAt.toIso8601String(),
      'valid': instance.valid,
    };
