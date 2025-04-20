// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserModel _$GetUserModelFromJson(Map<String, dynamic> json) => GetUserModel(
      user: json['data'] == null
          ? null
          : User.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserModelToJson(GetUserModel instance) =>
    <String, dynamic>{
      'data': instance.user,
    };
