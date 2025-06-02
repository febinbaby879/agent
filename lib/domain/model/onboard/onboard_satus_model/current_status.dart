import 'package:json_annotation/json_annotation.dart';

import 'stage.dart';

part 'current_status.g.dart';

@JsonSerializable()
class CurrentStatus {
  String? status;
  String? statusLabel;
  Stage? stage;
  DateTime? applicationDate;

  CurrentStatus({
    this.status,
    this.statusLabel,
    this.stage,
    this.applicationDate,
  });

  factory CurrentStatus.fromJson(Map<String, dynamic> json) {
    return _$CurrentStatusFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurrentStatusToJson(this);

  CurrentStatus copyWith({
    String? status,
    String? statusLabel,
    Stage? stage,
    DateTime? applicationDate,
  }) {
    return CurrentStatus(
      status: status ?? this.status,
      statusLabel: statusLabel ?? this.statusLabel,
      stage: stage ?? this.stage,
      applicationDate: applicationDate ?? this.applicationDate,
    );
  }
}
