// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dive _$DiveFromJson(Map<String, dynamic> json) => Dive(
      id: json['id'] as String,
      targetId: json['targetId'] as String,
      begin: DateTime.parse(json['begin'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      lastModified: DateTime.parse(json['lastModified'] as String),
    )..finder = json['finder'] as Map<String, dynamic>;

Map<String, dynamic> _$DiveToJson(Dive instance) => <String, dynamic>{
      'id': instance.id,
      'targetId': instance.targetId,
      'begin': instance.begin.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'lastModified': instance.lastModified.toIso8601String(),
      'finder': instance.finder,
    };
