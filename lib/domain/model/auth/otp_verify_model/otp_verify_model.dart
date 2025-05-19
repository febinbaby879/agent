import 'package:json_annotation/json_annotation.dart';

part 'otp_verify_model.g.dart';

@JsonSerializable()
class OtpVerifyModel {
  @JsonKey(name: 'agentEmailId')
  String? email;
  String? otp;

  OtpVerifyModel({this.email, this.otp});

  factory OtpVerifyModel.fromJson(Map<String, dynamic> json) {
    return _$OtpVerifyModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OtpVerifyModelToJson(this);
}
