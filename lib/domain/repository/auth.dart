import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:agent_dashboard/domain/model/auth/login/login_model/login_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_model/register_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_success_model/register_success_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterSuccessModel>> userRegister(
      {required RegisterModel registerModel});
  Future<Either<Failure, RegisterSuccessModel>> userLogin(
      {required LoginModel loginModel});
}
