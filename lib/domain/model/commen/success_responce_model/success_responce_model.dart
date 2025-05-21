import 'package:agent_dashboard/domain/model/commen/api_response/api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'success_responce_model.g.dart';

@JsonSerializable()
class SuccessResponceModel {
  String? message;
  bool? success;
  dynamic data;

  SuccessResponceModel({this.message, this.success, this.data});

  factory SuccessResponceModel.fromResponse(ApiResponse? responce) =>
      SuccessResponceModel(
          success: true, data: responce?.data, message: responce?.message);

  factory SuccessResponceModel.fromJson(Map<String, dynamic> json) {
    return _$SuccessResponceModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SuccessResponceModelToJson(this);
}
