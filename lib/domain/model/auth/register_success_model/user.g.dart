// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      agencyName: json['agencyName'] as String?,
      country: json['country'] as String?,
      agentAs: json['agentAs'] as String?,
      onboarding: json['onboarding'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'agencyName': instance.agencyName,
      'country': instance.country,
      'agentAs': instance.agentAs,
      'onboarding': instance.onboarding,
    };
