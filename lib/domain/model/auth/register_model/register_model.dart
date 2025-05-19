import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  String? agencyName;
  String? agentName;
  String? agentPhoneNumber;
  String? agentEmailId;
  String? agentCountry;
  String? directorName;
  String? directorContactNumber;
  String? email;
  String? password;

  RegisterModel({
    this.agencyName,
    this.agentName,
    this.agentPhoneNumber,
    this.agentEmailId,
    this.agentCountry,
    this.directorName,
    this.directorContactNumber,
    this.email,
    this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
