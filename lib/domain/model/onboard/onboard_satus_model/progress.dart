import 'package:json_annotation/json_annotation.dart';

part 'progress.g.dart';

@JsonSerializable()
class Progress {
  int? percentage;
  int? completedStages;
  int? totalStages;
  bool? isComplete;

  Progress({
    this.percentage,
    this.completedStages,
    this.totalStages,
    this.isComplete,
  });

  factory Progress.fromJson(Map<String, dynamic> json) {
    return _$ProgressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProgressToJson(this);

  Progress copyWith({
    int? percentage,
    int? completedStages,
    int? totalStages,
    bool? isComplete,
  }) {
    return Progress(
      percentage: percentage ?? this.percentage,
      completedStages: completedStages ?? this.completedStages,
      totalStages: totalStages ?? this.totalStages,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
