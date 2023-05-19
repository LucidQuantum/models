// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentTarget _$CurrentTargetFromJson(Map<String, dynamic> json) =>
    CurrentTarget(
      id: json['id'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
    );

Map<String, dynamic> _$CurrentTargetToJson(CurrentTarget instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTime': instance.startTime.toIso8601String(),
    };
