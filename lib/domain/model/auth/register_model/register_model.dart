import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  String? companyType;
  String? agentName;
  String? agentPhoneNumber;
  String? agentEmailId;
  String? agentCountry;
  String? email;
  String? password;
  String? source;

  RegisterModel({
    this.companyType,
    this.agentName,
    this.agentPhoneNumber,
    this.agentEmailId,
    this.agentCountry,
    this.email,
    this.password,
    this.source,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    final data = _$RegisterModelToJson(this);
    data.removeWhere((key, value) => value == null);
    return data;
  }
}
