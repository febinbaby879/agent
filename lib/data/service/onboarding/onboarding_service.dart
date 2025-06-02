import 'dart:developer';

import 'package:agent_dashboard/data/service/api_service.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/onboard/onboard_satus_model/onboard_satus_model.dart';
import 'package:agent_dashboard/domain/repository/onboarding_repo.dart';
import 'package:dartz/dartz.dart';

class OnboardingService implements OnboardingRepo {
  final ApiService _apiService = ApiService();

  @override
  Future<Either<Failure, OnboardSatusModel>> getOnboardStatus() async {
    try {
      final responce = await _apiService.get(ApiEndPoints.getOnboardingStatus);
      log('Success getOnboardStatus');
      if (responce.success ?? false) {
        return Right(OnboardSatusModel.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch getOnboardStatus $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
