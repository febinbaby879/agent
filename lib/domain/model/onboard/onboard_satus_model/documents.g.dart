// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Documents _$DocumentsFromJson(Map<String, dynamic> json) => Documents(
      agreementSigned: json['agreementSigned'] as bool?,
      onboardingComplete: json['onboardingComplete'] as bool?,
    );

Map<String, dynamic> _$DocumentsToJson(Documents instance) => <String, dynamic>{
      'agreementSigned': instance.agreementSigned,
      'onboardingComplete': instance.onboardingComplete,
    };
