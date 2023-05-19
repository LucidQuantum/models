// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      phone: json['phone'] as String,
      targets: (json['targets'] as List<dynamic>)
          .map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      .._DivingTargetIndex = json['_DivingTargetIndex'] as int?
      ..startTime = json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String)
      ..finder = json['finder'] as Map<String, dynamic>;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'targets': instance.targets.map((e) => e.toJson()).toList(),
      '_DivingTargetIndex': instance._DivingTargetIndex,
      'startTime': instance.startTime?.toIso8601String(),
      'finder': instance.finder,
    };
