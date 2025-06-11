import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/profile/agent_profile/agent_profile.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  Future<Either<Failure, AgentProfile>> getAgentProfileInfo(
      {required String id});
  Future<Either<Failure, AgentProfile>> updateProfileInfo(
      {required String id, required AgentProfile profile});
}
