// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadDocumentResponse _$UploadDocumentResponseFromJson(
        Map<String, dynamic> json) =>
    UploadDocumentResponse(
      uploadedDocuments: json['uploadedDocuments'] == null
          ? null
          : UploadedDocuments.fromJson(
              json['uploadedDocuments'] as Map<String, dynamic>),
      uploadCount: (json['uploadCount'] as num?)?.toInt(),
      agent: json['agent'] == null
          ? null
          : AgentProfile.fromJson(json['agent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadDocumentResponseToJson(
        UploadDocumentResponse instance) =>
    <String, dynamic>{
      'uploadedDocuments': instance.uploadedDocuments,
      'uploadCount': instance.uploadCount,
      'agent': instance.agent,
    };
