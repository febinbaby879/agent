// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentInfo _$AgentInfoFromJson(Map<String, dynamic> json) => AgentInfo(
      id: json['id'] as String?,
      name: json['name'] as String?,
      agency: json['agency'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$AgentInfoToJson(AgentInfo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'agency': instance.agency,
      'email': instance.email,
      'phone': instance.phone,
    };
