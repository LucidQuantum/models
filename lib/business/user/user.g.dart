// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      phone: json['phone'] as String,
      currentTarget: json['currentTarget'] == null
          ? null
          : CurrentTarget.fromJson(
              json['currentTarget'] as Map<String, dynamic>),
      lastModified: DateTime.parse(json['lastModified'] as String),
    )..finder = json['finder'] as Map<String, dynamic>;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'currentTarget': instance.currentTarget?.toJson(),
      'lastModified': instance.lastModified.toIso8601String(),
      'finder': instance.finder,
    };
