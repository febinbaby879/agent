import 'package:json_annotation/json_annotation.dart';

import 'generated_agreement.dart';

part 'agrement_model.g.dart';

@JsonSerializable()
class AgrementModel {
  GeneratedAgreement? generatedAgreement;

  AgrementModel({this.generatedAgreement});

  factory AgrementModel.fromJson(Map<String, dynamic> json) {
    return _$AgrementModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgrementModelToJson(this);
}
