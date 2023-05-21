// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Target _$TargetFromJson(Map<String, dynamic> json) => Target(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      caption: json['caption'] as String,
      state: $enumDecode(_$OrientStateEnumMap, json['state']),
      lastModified: DateTime.parse(json['lastModified'] as String),
    )..finder = json['finder'] as Map<String, dynamic>;

Map<String, dynamic> _$TargetToJson(Target instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'lastModified': instance.lastModified.toIso8601String(),
      'name': instance.name,
      'caption': instance.caption,
      'state': _$OrientStateEnumMap[instance.state]!,
      'finder': instance.finder,
    };

const _$OrientStateEnumMap = {
  OrientState.active: 'active',
  OrientState.discarded: 'discarded',
  OrientState.completed: 'completed',
};
