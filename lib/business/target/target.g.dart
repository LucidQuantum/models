// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Target _$TargetFromJson(Map<String, dynamic> json) => Target(
      id: json['id'] as String,
      name: json['name'] as String,
      caption: json['caption'] as String,
      dives: (json['dives'] as List<dynamic>)
          .map((e) => Dive.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: $enumDecode(_$OrientStateEnumMap, json['state']),
    );

Map<String, dynamic> _$TargetToJson(Target instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'caption': instance.caption,
      'dives': instance.dives.map((e) => e.toJson()).toList(),
      'state': _$OrientStateEnumMap[instance.state]!,
    };

const _$OrientStateEnumMap = {
  OrientState.active: 'active',
  OrientState.discarded: 'discarded',
  OrientState.completed: 'completed',
};
