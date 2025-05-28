import 'package:json_annotation/json_annotation.dart';

import 'agent_info.dart';
import 'current_status.dart';
import 'documents.dart';
import 'next_step.dart';
import 'progress.dart';
import 'stage.dart';

part 'onboard_satus_model.g.dart';

@JsonSerializable()
class OnboardSatusModel {
  AgentInfo? agentInfo;
  CurrentStatus? currentStatus;
  Progress? progress;
  List<Stage>? stages;
  dynamic currentSchedule;
  NextStep? nextStep;
  Documents? documents;

  OnboardSatusModel({
    this.agentInfo,
    this.currentStatus,
    this.progress,
    this.stages,
    this.currentSchedule,
    this.nextStep,
    this.documents,
  });

  factory OnboardSatusModel.fromJson(Map<String, dynamic> json) {
    return _$OnboardSatusModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OnboardSatusModelToJson(this);

  OnboardSatusModel copyWith({
    AgentInfo? agentInfo,
    CurrentStatus? currentStatus,
    Progress? progress,
    List<Stage>? stages,
    dynamic currentSchedule,
    NextStep? nextStep,
    Documents? documents,
  }) {
    return OnboardSatusModel(
      agentInfo: agentInfo ?? this.agentInfo,
      currentStatus: currentStatus ?? this.currentStatus,
      progress: progress ?? this.progress,
      stages: stages ?? this.stages,
      currentSchedule: currentSchedule ?? this.currentSchedule,
      nextStep: nextStep ?? this.nextStep,
      documents: documents ?? this.documents,
    );
  }
}
