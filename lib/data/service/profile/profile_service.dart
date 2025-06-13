import 'dart:developer';
import 'dart:typed_data';

import 'package:agent_dashboard/data/service/api_service.dart';
import 'package:agent_dashboard/data/shared_preference/shared_preferences.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/profile/agent_profile/agent_profile.dart';
import 'package:agent_dashboard/domain/model/profile/upload_document_response/upload_document_response.dart';
import 'package:agent_dashboard/domain/repository/profile_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:http_parser/http_parser.dart';

class ProfileService implements ProfileRepo {
  final ApiService _apiService = ApiService();

  @override
  Future<Either<Failure, AgentProfile>> getAgentProfileInfo(
      {required String id}) async {
    try {
      final responce = await _apiService
          .get(ApiEndPoints.getProfileInfo.replaceFirst('{id}', id));
      log('Success getAgentProfileInfo');
      if (responce.success ?? false) {
        log("getAgentProfileInfo: ${responce.data.toString()}");
        return Right(AgentProfile.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch getAgentProfileInfo $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AgentProfile>> updateProfileInfo(
      {required String id, required AgentProfile profile}) async {
    try {
      final responce = await _apiService.put(
          ApiEndPoints.updateProfileInfo.replaceFirst('{id}', id),
          data: profile.toJson());
      log('Success updateProfileInfo');
      if (responce.success ?? false) {
        log("updateProfileInfo: ${responce.data.toString()}");
        return Right(AgentProfile.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch updateProfileInfo $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UploadDocumentResponse>> uploadFile(
      {required Uint8List file, required String keyName}) async {
    try {
      final responce = await _apiService.post(
        ApiEndPoints.uploadProfileFiles
            .replaceFirst('{id}', await SharedPreferecesStorage.getUserId()),
        headers: {'Content-Type': 'multipart/form-data'},
        data: FormData.fromMap({
          keyName: MultipartFile.fromBytes(file,
              filename: '$keyName.png', contentType: MediaType('image', 'png')),
        }),
      );
      log('Success uploadFile');
      if (responce.success ?? false) {
        log('Success uploadFile 1');
        log("uploadFile: ${responce.data.toString()}");
        return Right(UploadDocumentResponse.fromJson(responce.data));
      } else {
        log('Success uploadFile 2 fail');
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch uploadFile $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
