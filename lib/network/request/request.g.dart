// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      id: json['id'] as String,
      command: json['command'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'id': instance.id,
      'command': instance.command,
      'data': instance.data,
    };
