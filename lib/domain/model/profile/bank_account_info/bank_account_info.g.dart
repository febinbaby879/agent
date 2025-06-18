// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankAccountInfo _$BankAccountInfoFromJson(Map<String, dynamic> json) =>
    BankAccountInfo(
      bankName: json['bankName'] as String?,
      currency: json['currency'] as String?,
      isDefault: json['isDefault'] as bool?,
      isActive: json['isActive'] as bool?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      accountHolderName: json['accountHolderName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      bankAddress: json['bankAddress'] as String?,
      swiftCode: json['swiftCode'] as String?,
      accountType: json['accountType'] as String?,
      iban: json['iban'] as String?,
    );

Map<String, dynamic> _$BankAccountInfoToJson(BankAccountInfo instance) =>
    <String, dynamic>{
      'bankName': instance.bankName,
      'currency': instance.currency,
      'isDefault': instance.isDefault,
      'isActive': instance.isActive,
      '_id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'accountHolderName': instance.accountHolderName,
      'accountNumber': instance.accountNumber,
      'bankAddress': instance.bankAddress,
      'swiftCode': instance.swiftCode,
      'accountType': instance.accountType,
      'iban': instance.iban,
    };
