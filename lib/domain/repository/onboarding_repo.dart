import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/commen/success_responce_model/success_responce_model.dart';
import 'package:agent_dashboard/domain/model/onboard/onboard_satus_model/onboard_satus_model.dart';
import 'package:agent_dashboard/domain/model/profile/agrement_model/agrement_model.dart';
import 'package:dartz/dartz.dart';

abstract class OnboardingRepo {
  Future<Either<Failure, AgrementModel>> getAgreement(
      {String? id, String? service});
  Future<Either<Failure, OnboardSatusModel>> getOnboardStatus();
}
