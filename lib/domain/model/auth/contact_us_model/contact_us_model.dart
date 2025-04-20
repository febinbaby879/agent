import 'package:json_annotation/json_annotation.dart';

part 'contact_us_model.g.dart';

@JsonSerializable()
class ContactUsModel {
  String? name;
  String? phone;
  String? email;
  String? message;

  ContactUsModel({this.name, this.phone, this.email, this.message});

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return _$ContactUsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactUsModelToJson(this);
}
