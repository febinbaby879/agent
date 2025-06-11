// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      wordCount: (json['wordCount'] as num?)?.toInt(),
      characterCount: (json['characterCount'] as num?)?.toInt(),
      estimatedPages: (json['estimatedPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'wordCount': instance.wordCount,
      'characterCount': instance.characterCount,
      'estimatedPages': instance.estimatedPages,
    };
