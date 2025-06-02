// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextStep _$NextStepFromJson(Map<String, dynamic> json) => NextStep(
      title: json['title'] as String?,
      message: json['message'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$NextStepToJson(NextStep instance) => <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'type': instance.type,
    };
