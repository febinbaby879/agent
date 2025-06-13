import 'dart:developer';
import 'dart:typed_data';

import 'package:agent_dashboard/data/service/api_service.dart';
import 'package:agent_dashboard/data/shared_preference/shared_preferences.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/profile/agrement_model/agrement_model.dart';
import 'package:agent_dashboard/domain/model/profile/upload_document_response/upload_document_response.dart';
import 'package:agent_dashboard/domain/repository/onboarding_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class OnboardingService implements OnboardingRepo {
  final ApiService _apiService = ApiService();

  @override
  Future<Either<Failure, AgrementModel>> getAgreement(
      {String? id, String? service}) async {
    try {
      log('reques getAgreement -> $service , $id');
      final responce = await _apiService.post(
          ApiEndPoints.getAgreement.replaceFirst('{id}', id ?? ''),
          data: {"service": service});
      log('Success getAgreement -> ${responce.data}');
      if (responce.success ?? false) {
        log('Success getAgreement 1');
        log("getAgreement: ${responce.data.toString()}");
        return Right(AgrementModel.fromJson(responce.data));
      } else {
        log('Success getAgreement 2 fail');
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch getAgreement $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UploadDocumentResponse>> uploadSignature(
      {required Uint8List signature, required String id}) async {
    try {
      final responce = await _apiService.post(
        ApiEndPoints.addSignatureToAgreement.replaceFirst('{id}', id),
        headers: {'Content-Type': 'multipart/form-data'},
        data: FormData.fromMap({
          'agentSignature': MultipartFile.fromBytes(signature,
              filename: 'signature.png',
              contentType: MediaType('image', 'png')),
        }),
      );
      log('Success uploadSignature');
      if (responce.success ?? false) {
        log('Success uploadSignature 1');
        log("uploadSignature: ${responce.data.toString()}");
        return Right(UploadDocumentResponse.fromJson(responce.data));
      } else {
        log('Success uploadSignature 2 fail');
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch uploadSignature $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
