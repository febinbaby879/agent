import 'package:agent_dashboard/domain/model/auth/otp_verify_model/otp_verify_model.dart';
import 'package:agent_dashboard/domain/model/auth/rest_new_password/rest_new_password.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/commen/success_responce_model/success_responce_model.dart';
import 'package:dartz/dartz.dart';
import 'package:agent_dashboard/domain/model/auth/login/login_model/login_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_model/register_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_success_model/register_success_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterSuccessModel>> userRegister(
      {required RegisterModel registerModel});
  Future<Either<Failure, RegisterSuccessModel>> verifOtpRegister(
      {required OtpVerifyModel otpVerifyModel});
  Future<Either<Failure, RegisterSuccessModel>> userLogin(
      {required LoginModel loginModel});
  Future<Either<Failure, SuccessResponceModel>> forgotPassword(
      {required RestNewPassword restNewPassword});
  Future<Either<Failure, SuccessResponceModel>> resetPassword(
      {required RestNewPassword restNewPassword});
}
