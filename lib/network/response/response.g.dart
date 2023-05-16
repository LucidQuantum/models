// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      id: json['id'] as String?,
      success: json['success'] as bool,
      message: json['message'],
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'id': instance.id,
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
