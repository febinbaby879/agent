// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankOperation _$BankOperationFromJson(Map<String, dynamic> json) =>
    BankOperation(
      operation: json['operation'] as String?,
      bankData: json['bankData'] == null
          ? null
          : BankAccountInfo.fromJson(json['bankData'] as Map<String, dynamic>),
      bankId: json['bankId'] as String?,
    );

Map<String, dynamic> _$BankOperationToJson(BankOperation instance) =>
    <String, dynamic>{
      'operation': instance.operation,
      'bankId': instance.bankId,
      'bankData': instance.bankData,
    };
