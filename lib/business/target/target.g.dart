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
    );

Map<String, dynamic> _$TargetToJson(Target instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'caption': instance.caption,
      'state': _$OrientStateEnumMap[instance.state]!,
    };

const _$OrientStateEnumMap = {
  OrientState.active: 'active',
  OrientState.discarded: 'discarded',
  OrientState.completed: 'completed',
};
