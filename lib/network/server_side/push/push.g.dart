// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Push _$PushFromJson(Map<String, dynamic> json) => Push(
      id: json['id'] as String,
      operation: (json['operation'] as List<dynamic>)
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PushToJson(Push instance) => <String, dynamic>{
      'id': instance.id,
      'operation': instance.operation.map((e) => e.toJson()).toList(),
    };
