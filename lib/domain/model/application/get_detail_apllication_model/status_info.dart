class StatusInfo {
  String? status;
  String? currentStage;
  String? currentSubStage;
  bool? isVisaRequired;
  bool? isCompleted;

  StatusInfo({
    this.status,
    this.currentStage,
    this.currentSubStage,
    this.isVisaRequired,
    this.isCompleted,
  });

  factory StatusInfo.fromJson(Map<String, dynamic> json) => StatusInfo(
        status: json['status'] as String?,
        currentStage: json['currentStage'] as String?,
        currentSubStage: json['currentSubStage'] as String?,
        isVisaRequired: json['isVisaRequired'] as bool?,
        isCompleted: json['isCompleted'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'currentStage': currentStage,
        'currentSubStage': currentSubStage,
        'isVisaRequired': isVisaRequired,
        'isCompleted': isCompleted,
      };
}
