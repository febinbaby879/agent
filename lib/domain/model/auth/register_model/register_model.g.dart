// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      companyType: json['companyType'] as String?,
      agentName: json['agentName'] as String?,
      agentPhoneNumber: json['agentPhoneNumber'] as String?,
      agentEmailId: json['agentEmailId'] as String?,
      agentCountry: json['agentCountry'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'companyType': instance.companyType,
      'agentName': instance.agentName,
      'agentPhoneNumber': instance.agentPhoneNumber,
      'agentEmailId': instance.agentEmailId,
      'agentCountry': instance.agentCountry,
      'email': instance.email,
      'password': instance.password,
      'source': instance.source,
    };
