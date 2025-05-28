// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Progress _$ProgressFromJson(Map<String, dynamic> json) => Progress(
      percentage: (json['percentage'] as num?)?.toInt(),
      completedStages: (json['completedStages'] as num?)?.toInt(),
      totalStages: (json['totalStages'] as num?)?.toInt(),
      isComplete: json['isComplete'] as bool?,
    );

Map<String, dynamic> _$ProgressToJson(Progress instance) => <String, dynamic>{
      'percentage': instance.percentage,
      'completedStages': instance.completedStages,
      'totalStages': instance.totalStages,
      'isComplete': instance.isComplete,
    };
