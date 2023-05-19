// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Operation _$OperationFromJson(Map<String, dynamic> json) => Operation(
      id: json['id'] as String,
      previousOperationId: json['previousOperationId'] as String,
      model: $enumDecode(_$OperationModelEnumMap, json['model']),
      type: $enumDecode(_$OperationTypeEnumMap, json['type']),
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$OperationToJson(Operation instance) => <String, dynamic>{
      'id': instance.id,
      'previousOperationId': instance.previousOperationId,
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
  OperationType.create: 'create',
  OperationType.update: 'update',
  OperationType.delete: 'delete',
};
