// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) => Operation(
      createTime: DateTime.parse(json['createTime'] as String),
      lastOperationTime: DateTime.parse(json['lastOperationTime'] as String),
      model: $enumDecode(_$OperationModelEnumMap, json['model']),
      type: $enumDecode(_$OperationTypeEnumMap, json['type']),
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$OperationToJson(Operation instance) => <String, dynamic>{
      'createTime': instance.createTime.toIso8601String(),
      'lastOperationTime': instance.lastOperationTime.toIso8601String(),
      'model': _$OperationModelEnumMap[instance.model]!,
      'type': _$OperationTypeEnumMap[instance.type]!,
      'data': instance.data,
    };

const _$OperationModelEnumMap = {
  OperationModel.user: 'user',
  OperationModel.target: 'target',
  OperationModel.dive: 'dive',
};

const _$OperationTypeEnumMap = {
  OperationType.insert: 'insert',
  OperationType.create: 'create',
  OperationType.update: 'update',
  OperationType.delete: 'delete',
};
