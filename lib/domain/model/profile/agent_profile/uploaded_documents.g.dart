// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploaded_documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadedDocuments _$UploadedDocumentsFromJson(Map<String, dynamic> json) =>
    UploadedDocuments(
      businessLicense: json['businessLicense'] as String?,
      signedAgreement: json['signedAgreement'] as String?,
      passportFile: json['passportFile'] as String?,
      profileImg: json['profileImg'] as String?,
      agentSignature: json['agentSignature'] as String?,
    );

Map<String, dynamic> _$UploadedDocumentsToJson(UploadedDocuments instance) =>
    <String, dynamic>{
      'businessLicense': instance.businessLicense,
      'signedAgreement': instance.signedAgreement,
      'passportFile': instance.passportFile,
      'profileImg': instance.profileImg,
      'agentSignature': instance.agentSignature,
    };
