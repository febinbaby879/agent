import 'dart:typed_data';

import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/commen/success_responce_model/success_responce_model.dart';
import 'package:agent_dashboard/domain/model/profile/agent_profile/agent_profile.dart';
import 'package:agent_dashboard/domain/model/profile/bank_account_info/bank_operation.dart';
import 'package:agent_dashboard/domain/model/profile/upload_document_response/upload_document_response.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, AgentProfile>> getAgentProfileInfo(
      {required String id});
  Future<Either<Failure, AgentProfile>> updateProfileInfo(
      {required String id, required AgentProfile profile});
  Future<Either<Failure, UploadDocumentResponse>> uploadFile(
      {required Uint8List file, required String keyName});
  Future<Either<Failure, SuccessResponceModel>> bankingOperation(
      {required BankOperation bankingOperation});
}
