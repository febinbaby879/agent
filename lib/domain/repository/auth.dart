import 'package:agent_dashboard/domain/core/failure/failure.dart';
import 'package:agent_dashboard/domain/model/success_responce_model/success_responce_model.dart';
import 'package:dartz/dartz.dart';
import 'package:agent_dashboard/domain/model/auth/get_user_model/get_user_model.dart';
import 'package:agent_dashboard/domain/model/auth/login/login_model/login_model.dart';
import 'package:agent_dashboard/domain/model/auth/otp_verify_model/otp_verify_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_model/register_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_success_model/register_success_model.dart';
import 'package:agent_dashboard/domain/model/auth/reset_password_model/reset_password_model.dart';
import 'package:agent_dashboard/domain/model/auth/update_user_model/update_user_model.dart';
import 'package:dio/dio.dart' as dio;

abstract class AuthRepo {
  Future<Either<Failure, RegisterSuccessModel>> userRegister(
      {required RegisterModel registerModel});
  Future<Either<Failure, RegisterSuccessModel>> userLogin(
      {required LoginModel loginModel});
  Future<Either<Failure, GetUserModel>> getUser();
  Future<Either<Failure, SuccessResponceModel>> updateUser(
      {required UpdateUserModel updateUserModel});
  Future<Either<Failure, SuccessResponceModel>> oTPSending(
      {required String email});
  Future<Either<Failure, SuccessResponceModel>> verifyResetPasswordOTP(
      {required OtpVerifyModel otpVerify});
  Future<Either<Failure, SuccessResponceModel>> resetPassword(
      {required ResetPasswordModel resetPassword});
  Future<Either<Failure, SuccessResponceModel>> contactUS(
      {required dio.FormData formData});
  Future<Either<Failure, SuccessResponceModel>> accountSoftDelete(
      {required String userId});
}
