// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_new_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestNewPassword _$RestNewPasswordFromJson(Map<String, dynamic> json) =>
    RestNewPassword(
      email: json['email'] as String?,
      otp: json['otp'] as String?,
      newPassword: json['newPassword'] as String?,
    );

Map<String, dynamic> _$RestNewPasswordToJson(RestNewPassword instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
      'newPassword': instance.newPassword,
    };
