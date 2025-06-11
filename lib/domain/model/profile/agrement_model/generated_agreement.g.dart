// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_agreement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedAgreement _$GeneratedAgreementFromJson(Map<String, dynamic> json) =>
    GeneratedAgreement(
      content: json['content'] as String?,
      generatedAt: json['generatedAt'] == null
          ? null
          : DateTime.parse(json['generatedAt'] as String),
      agreementNumber: json['agreementNumber'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      logoUrl: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$GeneratedAgreementToJson(GeneratedAgreement instance) =>
    <String, dynamic>{
      'content': instance.content,
      'generatedAt': instance.generatedAt?.toIso8601String(),
      'agreementNumber': instance.agreementNumber,
      'metadata': instance.metadata,
      'logoUrl': instance.logoUrl,
    };
