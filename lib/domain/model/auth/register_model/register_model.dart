import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  String? fullName;
  String? email;
  String? password;

  RegisterModel({this.fullName, this.email, this.password});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
