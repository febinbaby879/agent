import 'package:json_annotation/json_annotation.dart';

part 'success_responce_model.g.dart';

@JsonSerializable()
class SuccessResponceModel {
  String? message;
  bool? success;

  SuccessResponceModel({this.message, this.success});

  factory SuccessResponceModel.fromJson(Map<String, dynamic> json) {
    return _$SuccessResponceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SuccessResponceModelToJson(this);
}
