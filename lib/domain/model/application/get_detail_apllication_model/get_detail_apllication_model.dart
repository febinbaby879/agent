import 'data.dart';

class GetDetailApllication {
  bool? success;
  GetDetailApplicationData? data;

  GetDetailApllication({this.success, this.data});

  factory GetDetailApllication.fromJson(Map<String, dynamic> json) {
    return GetDetailApllication(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : GetDetailApplicationData.fromJson(
              json['data'] as Map<String, dynamic>),
    );
  }

  // Map<String, dynamic> toJson() => {
  //       'success': success,
  //       'data': data?.toJson(),
  //     };
}
