import 'package:agent_dashboard/domain/model/onboard/onboard_satus_model/schedule.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stage.g.dart';

@JsonSerializable()
class Stage {
  String? key;
  String? name;
  String? description;
  String? subStage;
  String? subStageName;
  String? color;
  Schedule? schedule;

  Stage({
    this.key,
    this.name,
    this.description,
    this.subStage,
    this.subStageName,
    this.color,
    this.schedule,
  });

  factory Stage.fromJson(Map<String, dynamic> json) => _$StageFromJson(json);

  Map<String, dynamic> toJson() => _$StageToJson(this);

  Stage copyWith({
    String? key,
    String? name,
    String? description,
    String? subStage,
    String? subStageName,
    String? color,
    Schedule? schedule,
  }) {
    return Stage(
      key: key ?? this.key,
      name: name ?? this.name,
      description: description ?? this.description,
      subStage: subStage ?? this.subStage,
      subStageName: subStageName ?? this.subStageName,
      color: color ?? this.color,
      schedule: schedule ?? this.schedule,
    );
  }
}
