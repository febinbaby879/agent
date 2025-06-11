// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentProfile _$AgentProfileFromJson(Map<String, dynamic> json) => AgentProfile(
      agentId: json['agentId'] as String?,
      agentName: json['agentName'] as String?,
      agentPhoneNumber: json['agentPhoneNumber'] as String?,
      agentEmailId: json['agentEmailId'] as String?,
      agentCountry: json['agentCountry'] as String?,
      companyType: json['companyType'] as String?,
      businessLicense: json['businessLicense'] as String?,
      passportFile: json['passportFile'] as String?,
      profileImg: json['profileImg'] as String?,
      socialMediaLinks: json['socialMediaLinks'] as List<dynamic>?,
      designation: json['designation'] as String?,
      nameofContactPerson: json['nameofContactPerson'] as String?,
      fullAddress: json['fullAddress'] as String?,
      websiteLink: json['websiteLink'] as String?,
      dateofBirth: json['dateofBirth'] as String?,
      directorName: json['directorName'] as String?,
      directorContactNumber: json['directorContactNumber'] as String?,
      businessRegNum: json['businessRegNum'] as String?,
      onboading: json['onboading'] as bool?,
    );

Map<String, dynamic> _$AgentProfileToJson(AgentProfile instance) =>
    <String, dynamic>{
      'agentId': instance.agentId,
      'agentName': instance.agentName,
      'agentPhoneNumber': instance.agentPhoneNumber,
      'agentEmailId': instance.agentEmailId,
      'agentCountry': instance.agentCountry,
      'companyType': instance.companyType,
      'businessLicense': instance.businessLicense,
      'passportFile': instance.passportFile,
      'profileImg': instance.profileImg,
      'socialMediaLinks': instance.socialMediaLinks,
      'designation': instance.designation,
      'nameofContactPerson': instance.nameofContactPerson,
      'fullAddress': instance.fullAddress,
      'websiteLink': instance.websiteLink,
      'dateofBirth': instance.dateofBirth,
      'directorName': instance.directorName,
      'directorContactNumber': instance.directorContactNumber,
      'businessRegNum': instance.businessRegNum,
      'onboading': instance.onboading,
    };
