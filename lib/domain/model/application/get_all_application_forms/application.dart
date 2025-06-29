class ApplicationModel {
  String? applicationId;
  String? studentName;
  String? emailId;
  String? mobileNumber;
  String? status;
  String? currentStage;
  String? currentSubStage;
  dynamic agentProject;
  dynamic preferredCountry;
  String? courseName;
  String? instituteName;
  dynamic assignedTo;
  bool? isCompleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  ApplicationModel({
    this.applicationId,
    this.studentName,
    this.emailId,
    this.mobileNumber,
    this.status,
    this.currentStage,
    this.currentSubStage,
    this.agentProject,
    this.preferredCountry,
    this.courseName,
    this.instituteName,
    this.assignedTo,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      ApplicationModel(
        applicationId: json['applicationId'] as String?,
        studentName: json['studentName'] as String?,
        emailId: json['emailId'] as String?,
        mobileNumber: json['mobileNumber'] as String?,
        status: json['status'] as String?,
        currentStage: json['currentStage'] as String?,
        currentSubStage: json['currentSubStage'] as String?,
        agentProject: json['agentProject'] as dynamic,
        preferredCountry: json['preferredCountry'] as dynamic,
        courseName: json['courseName'] as String?,
        instituteName: json['instituteName'] as String?,
        assignedTo: json['assignedTo'] as dynamic,
        isCompleted: json['isCompleted'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'applicationId': applicationId,
        'studentName': studentName,
        'emailId': emailId,
        'mobileNumber': mobileNumber,
        'status': status,
        'currentStage': currentStage,
        'currentSubStage': currentSubStage,
        'agentProject': agentProject,
        'preferredCountry': preferredCountry,
        'courseName': courseName,
        'instituteName': instituteName,
        'assignedTo': assignedTo,
        'isCompleted': isCompleted,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
