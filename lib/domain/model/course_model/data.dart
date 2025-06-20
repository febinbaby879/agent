import 'course.dart';

class CourseData {
  String? projectName;
  String? agentType;
  List<Course>? courses;
  int? totalCourses;

  CourseData(
      {this.projectName, this.agentType, this.courses, this.totalCourses});

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
        projectName: json['projectName'] as String?,
        agentType: json['agentType'] as String?,
        courses: (json['courses'] as List<dynamic>?)
            ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalCourses: json['totalCourses'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'projectName': projectName,
        'agentType': agentType,
        'courses': courses?.map((e) => e.toJson()).toList(),
        'totalCourses': totalCourses,
      };
}
