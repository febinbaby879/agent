// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_satus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnboardSatusModel _$OnboardSatusModelFromJson(Map<String, dynamic> json) =>
    OnboardSatusModel(
      agentInfo: json['agentInfo'] == null
          ? null
          : AgentInfo.fromJson(json['agentInfo'] as Map<String, dynamic>),
      currentStatus: json['currentStatus'] == null
          ? null
          : CurrentStatus.fromJson(
              json['currentStatus'] as Map<String, dynamic>),
      progress: json['progress'] == null
          ? null
          : Progress.fromJson(json['progress'] as Map<String, dynamic>),
      stages: (json['stages'] as List<dynamic>?)
          ?.map((e) => Stage.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentSchedule: json['currentSchedule'],
      nextStep: json['nextStep'] == null
          ? null
          : NextStep.fromJson(json['nextStep'] as Map<String, dynamic>),
      documents: json['documents'] == null
          ? null
          : Documents.fromJson(json['documents'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OnboardSatusModelToJson(OnboardSatusModel instance) =>
    <String, dynamic>{
      'agentInfo': instance.agentInfo,
      'currentStatus': instance.currentStatus,
      'progress': instance.progress,
      'stages': instance.stages,
      'currentSchedule': instance.currentSchedule,
      'nextStep': instance.nextStep,
      'documents': instance.documents,
    };
