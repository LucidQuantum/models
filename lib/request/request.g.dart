// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      id: json['id'] as String,
      type: $enumDecode(_$TypeEnumMap, json['type']),
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$TypeEnumMap[instance.type]!,
      'data': instance.data,
    };

const _$TypeEnumMap = {
  RequestType.sendSms: 'sendSms',
  RequestType.smsLogin: 'smsLogin',
  RequestType.tokenLogin: 'tokenLogin',
  RequestType.createOrient: 'createOrient',
  RequestType.startDive: 'startDive',
  RequestType.finishDive: 'finishDive',
};
