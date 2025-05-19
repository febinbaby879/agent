// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      agencyName: json['agencyName'] as String?,
      agentName: json['agentName'] as String?,
      agentPhoneNumber: json['agentPhoneNumber'] as String?,
      agentEmailId: json['agentEmailId'] as String?,
      agentCountry: json['agentCountry'] as String?,
      directorName: json['directorName'] as String?,
      directorContactNumber: json['directorContactNumber'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'agencyName': instance.agencyName,
      'agentName': instance.agentName,
      'agentPhoneNumber': instance.agentPhoneNumber,
      'agentEmailId': instance.agentEmailId,
      'agentCountry': instance.agentCountry,
      'directorName': instance.directorName,
      'directorContactNumber': instance.directorContactNumber,
      'email': instance.email,
      'password': instance.password,
    };
