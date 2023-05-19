// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sms _$SmsFromJson(Map<String, dynamic> json) => Sms(
      phone: json['phone'] as String,
      code: json['code'] as String,
      createAt: DateTime.parse(json['createAt'] as String),
      isUsed: json['isUsed'] as bool,
    )..finder = json['finder'] as Map<String, dynamic>;

Map<String, dynamic> _$SmsToJson(Sms instance) => <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
      'createAt': instance.createAt.toIso8601String(),
      'isUsed': instance.isUsed,
      'finder': instance.finder,
    };
