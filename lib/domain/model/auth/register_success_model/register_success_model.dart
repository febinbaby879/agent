import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'register_success_model.g.dart';

@JsonSerializable()
class RegisterSuccessModel {
  String? message;
  String? token;
  User? user;

  RegisterSuccessModel({this.message, this.token, this.user});

  factory RegisterSuccessModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterSuccessModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterSuccessModelToJson(this);
}
