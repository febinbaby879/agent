import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/onboard/onboard_satus_model/onboard_satus_model.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardingRepo {
  Future<Either<Failure, OnboardSatusModel>> getOnboardStatus();
}
