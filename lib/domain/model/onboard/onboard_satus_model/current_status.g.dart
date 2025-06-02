// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentStatus _$CurrentStatusFromJson(Map<String, dynamic> json) =>
    CurrentStatus(
      status: json['status'] as String?,
      statusLabel: json['statusLabel'] as String?,
      stage: json['stage'] == null
          ? null
          : Stage.fromJson(json['stage'] as Map<String, dynamic>),
      applicationDate: json['applicationDate'] == null
          ? null
          : DateTime.parse(json['applicationDate'] as String),
    );

Map<String, dynamic> _$CurrentStatusToJson(CurrentStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'statusLabel': instance.statusLabel,
      'stage': instance.stage,
      'applicationDate': instance.applicationDate?.toIso8601String(),
    };
