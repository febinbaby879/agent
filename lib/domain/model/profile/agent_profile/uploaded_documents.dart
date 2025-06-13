import 'package:json_annotation/json_annotation.dart';

part 'uploaded_documents.g.dart';

@JsonSerializable()
class UploadedDocuments {
  String? businessLicense;
  String? signedAgreement;
  String? passportFile;
  String? profileImg;
  String? agentSignature;

  UploadedDocuments({
    this.businessLicense,
    this.signedAgreement,
    this.passportFile,
    this.profileImg,
    this.agentSignature,
  });

  factory UploadedDocuments.fromJson(Map<String, dynamic> json) {
    return _$UploadedDocumentsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UploadedDocumentsToJson(this);
}
