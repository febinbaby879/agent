import 'data.dart';

class GetAllApplicationForms {
  bool? success;
  ApplicationData? data;

  GetAllApplicationForms({this.success, this.data});

  factory GetAllApplicationForms.fromJson(Map<String, dynamic> json) {
    return GetAllApplicationForms(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : ApplicationData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
      };
}
