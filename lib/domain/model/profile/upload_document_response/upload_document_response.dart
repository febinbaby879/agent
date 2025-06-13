import 'package:agent_dashboard/domain/model/profile/agent_profile/agent_profile.dart';
import 'package:json_annotation/json_annotation.dart';

import '../agent_profile/uploaded_documents.dart';

part 'upload_document_response.g.dart';

@JsonSerializable()
class UploadDocumentResponse {
  UploadedDocuments? uploadedDocuments;
  int? uploadCount;
  AgentProfile? agent;

  UploadDocumentResponse({
    this.uploadedDocuments,
    this.uploadCount,
    this.agent,
  });

  factory UploadDocumentResponse.fromJson(Map<String, dynamic> json) {
    return _$UploadDocumentResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UploadDocumentResponseToJson(this);
}
