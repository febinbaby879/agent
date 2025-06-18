// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetail _$BankDetailFromJson(Map<String, dynamic> json) => BankDetail(
      allBankAccounts: (json['allBankAccounts'] as List<dynamic>?)
          ?.map((e) => BankAccountInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultBankAccount: json['defaultBankAccount'] == null
          ? null
          : BankAccountInfo.fromJson(
              json['defaultBankAccount'] as Map<String, dynamic>),
      totalBankAccounts: (json['totalBankAccounts'] as num?)?.toInt(),
      hasBankDetails: json['hasBankDetails'] as bool?,
    );

Map<String, dynamic> _$BankDetailToJson(BankDetail instance) =>
    <String, dynamic>{
      'allBankAccounts': instance.allBankAccounts,
      'defaultBankAccount': instance.defaultBankAccount,
      'totalBankAccounts': instance.totalBankAccounts,
      'hasBankDetails': instance.hasBankDetails,
    };
