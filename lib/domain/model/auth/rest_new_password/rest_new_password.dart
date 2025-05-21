import 'package:json_annotation/json_annotation.dart';

part 'rest_new_password.g.dart';

@JsonSerializable()
class RestNewPassword {
  String? email;
  String? otp;
  String? newPassword;

  RestNewPassword({this.email, this.otp, this.newPassword});

  factory RestNewPassword.fromJson(Map<String, dynamic> json) {
    return _$RestNewPasswordFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (email != null) data['email'] = email;
    if (otp != null) data['otp'] = otp;
    if (newPassword != null) data['newPassword'] = newPassword;
    return data;
  }

  RestNewPassword copyWith({
    String? email,
    String? otp,
    String? newPassword,
  }) {
    return RestNewPassword(
      email: email ?? this.email,
      otp: otp ?? this.otp,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}
