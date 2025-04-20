// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_success_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterSuccessModel _$RegisterSuccessModelFromJson(
        Map<String, dynamic> json) =>
    RegisterSuccessModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterSuccessModelToJson(
        RegisterSuccessModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
