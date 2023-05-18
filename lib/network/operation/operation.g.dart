// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) => Operation(
      id: json['id'] as String,
      command: json['command'] as String,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$OperationToJson(Operation instance) => <String, dynamic>{
      'id': instance.id,
      'command': instance.command,
      'data': instance.data,
    };
