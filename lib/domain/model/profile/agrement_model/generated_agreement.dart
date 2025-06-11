import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';

part 'generated_agreement.g.dart';

@JsonSerializable()
class GeneratedAgreement {
  String? content;
  DateTime? generatedAt;
  String? agreementNumber;
  Metadata? metadata;
  String? logoUrl;

  GeneratedAgreement({
    this.content,
    this.generatedAt,
    this.agreementNumber,
    this.metadata,
    this.logoUrl,
  });

  factory GeneratedAgreement.fromJson(Map<String, dynamic> json) {
    return _$GeneratedAgreementFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeneratedAgreementToJson(this);
}
