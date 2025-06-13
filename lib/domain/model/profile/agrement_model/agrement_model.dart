import 'package:json_annotation/json_annotation.dart';

import 'generated_agreement.dart';
import 'signature_status.dart';

part 'agrement_model.g.dart';

@JsonSerializable()
class AgrementModel {
  GeneratedAgreement? generatedAgreement;
  SignatureStatus? signatureStatus;

  AgrementModel({this.generatedAgreement, this.signatureStatus});

  factory AgrementModel.fromJson(Map<String, dynamic> json) {
    return _$AgrementModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AgrementModelToJson(this);
}
