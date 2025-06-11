import 'dart:developer';

import 'package:agent_dashboard/data/service/api_service.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/commen/success_responce_model/success_responce_model.dart';
import 'package:agent_dashboard/domain/model/onboard/onboard_satus_model/onboard_satus_model.dart';
import 'package:agent_dashboard/domain/model/profile/agrement_model/agrement_model.dart';
import 'package:agent_dashboard/domain/repository/onboarding_repo.dart';
import 'package:dartz/dartz.dart';

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
  Future<Either<Failure, OnboardSatusModel>> getOnboardStatus() async {
    try {
      final responce = await _apiService.get(ApiEndPoints.getOnboardingStatus);
      log('Success getOnboardStatus');
      if (responce.success ?? false) {
        log('Success getOnboardStatus 1');
        log("getOnboardStatus: ${responce.data.toString()}");
        return Right(OnboardSatusModel.fromJson(responce.data));
      } else {
        log('Success getOnboardStatus 2 fail');
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch getOnboardStatus $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
