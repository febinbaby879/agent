// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stage _$StageFromJson(Map<String, dynamic> json) => Stage(
      key: json['key'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      subStage: json['subStage'] as String?,
      subStageName: json['subStageName'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$StageToJson(Stage instance) => <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'description': instance.description,
      'subStage': instance.subStage,
      'subStageName': instance.subStageName,
      'color': instance.color,
    };
