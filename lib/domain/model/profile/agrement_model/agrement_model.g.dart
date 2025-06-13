// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agrement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgrementModel _$AgrementModelFromJson(Map<String, dynamic> json) =>
    AgrementModel(
      generatedAgreement: json['generatedAgreement'] == null
          ? null
          : GeneratedAgreement.fromJson(
              json['generatedAgreement'] as Map<String, dynamic>),
      signatureStatus: json['signatureStatus'] == null
          ? null
          : SignatureStatus.fromJson(
              json['signatureStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AgrementModelToJson(AgrementModel instance) =>
    <String, dynamic>{
      'generatedAgreement': instance.generatedAgreement,
      'signatureStatus': instance.signatureStatus,
    };
