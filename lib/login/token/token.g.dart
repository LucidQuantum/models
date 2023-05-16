// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      deviceId: json['deviceId'] as String,
      userId: json['userId'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'deviceId': instance.deviceId,
      'userId': instance.userId,
      'token': instance.token,
    };
