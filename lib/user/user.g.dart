// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      phone: json['phone'] as String,
      orients: (json['orients'] as List<dynamic>)
          .map((e) => Orient.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..currentOrient = json['currentOrient'] == null
          ? null
          : Orient.fromJson(json['currentOrient'] as Map<String, dynamic>)
      ..startTime = json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'orients': instance.orients.map((e) => e.toJson()).toList(),
      'currentOrient': instance.currentOrient?.toJson(),
      'startTime': instance.startTime?.toIso8601String(),
    };
