// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      success: json['success'] as bool,
      message: json['message'],
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
