class ProjectInfo {
  String? agentProject;
  dynamic preferredCountry;
  String? courseName;
  String? instituteName;
  String? highestQualification;
  String? startDate;
  String? endDate;

  ProjectInfo({
    this.agentProject,
    this.preferredCountry,
    this.courseName,
    this.instituteName,
    this.highestQualification,
    this.startDate,
    this.endDate,
  });

  factory ProjectInfo.fromJson(Map<String, dynamic> json) => ProjectInfo(
        agentProject: json['agentProject'] as String?,
        preferredCountry: json['preferredCountry'] as dynamic,
        courseName: json['courseName'] as String?,
        instituteName: json['instituteName'] as String?,
        highestQualification: json['highestQualification'] as String?,
        startDate: json['startDate'] as String?,
        endDate: json['endDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'agentProject': agentProject,
        'preferredCountry': preferredCountry,
        'courseName': courseName,
        'instituteName': instituteName,
        'highestQualification': highestQualification,
        'startDate': startDate,
        'endDate': endDate,
      };
}
