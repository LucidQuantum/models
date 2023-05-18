// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      phone: json['phone'] as String,
      targets: (json['orients'] as List<dynamic>)
          .map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      .._DivingTargetIndex = json['_currentOrientIndex'] as int?
      ..startTime = json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'orients': instance.targets.map((e) => e.toJson()).toList(),
      '_currentOrientIndex': instance._DivingTargetIndex,
      'startTime': instance.startTime?.toIso8601String(),
    };
