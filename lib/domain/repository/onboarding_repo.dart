import 'dart:typed_data';

import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/profile/agrement_model/agrement_model.dart';
import 'package:agent_dashboard/domain/model/profile/upload_document_response/upload_document_response.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardingRepo {
  Future<Either<Failure, AgrementModel>> getAgreement(
      {String? id, String? service});
  Future<Either<Failure, UploadDocumentResponse>> uploadSignature(
      {required Uint8List signature, required String id});
}
