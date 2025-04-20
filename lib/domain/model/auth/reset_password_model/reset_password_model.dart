import 'package:json_annotation/json_annotation.dart';

part 'reset_password_model.g.dart';

@JsonSerializable()
class ResetPasswordModel {
  String? email;
  String? newPassword;

  ResetPasswordModel({this.email, this.newPassword});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResetPasswordModelToJson(this);
}
