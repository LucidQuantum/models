// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dive _$DiveFromJson(Map<String, dynamic> json) => Dive(
      begin: DateTime.parse(json['begin'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$DiveToJson(Dive instance) => <String, dynamic>{
      'begin': instance.begin.toIso8601String(),
      'end': instance.end.toIso8601String(),
    };
