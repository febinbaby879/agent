import 'data.dart';

class CourseModel {
  bool? success;
  String? message;
  CourseData? courseData;

  CourseModel({this.success, this.message, this.courseData});

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        courseData: json['data'] == null
            ? null
            : CourseData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() =>
      {'success': success, 'message': message, 'data': courseData?.toJson()};
}
