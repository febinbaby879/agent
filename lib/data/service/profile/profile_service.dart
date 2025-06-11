import 'dart:developer';

import 'package:agent_dashboard/data/service/api_service.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/profile/agent_profile/agent_profile.dart';
import 'package:agent_dashboard/domain/repository/profile_repo.dart';
import 'package:dartz/dartz.dart';

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
}
