import 'dart:developer';
import 'package:agent_dashboard/data/service/api_service.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/model/auth/otp_verify_model/otp_verify_model.dart';
import 'package:agent_dashboard/domain/model/auth/rest_new_password/rest_new_password.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/commen/success_responce_model/success_responce_model.dart';
import 'package:dartz/dartz.dart';
import 'package:agent_dashboard/domain/model/auth/login/login_model/login_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_model/register_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_success_model/register_success_model.dart';
import 'package:agent_dashboard/domain/repository/auth_repo.dart';

class AuthService implements AuthRepo {
  final ApiService apiService = ApiService(addToken: false);

  @override
  Future<Either<Failure, RegisterSuccessModel>> userLogin(
      {required LoginModel loginModel}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.userLogin,
          data: loginModel.toJson());
      log('Success userLogin');
      if (responce.success ?? false) {
        return Right(RegisterSuccessModel.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch userLogin $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterSuccessModel>> userRegister(
      {required RegisterModel registerModel}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.userRegistration,
          data: registerModel.toJson());
      log('Success userRegister');
      if (responce.success ?? false) {
        return Right(RegisterSuccessModel.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch userRegister $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterSuccessModel>> verifOtpRegister(
      {required OtpVerifyModel otpVerifyModel}) async {
    try {
      final responce = await apiService.post(
          ApiEndPoints.registerOtpVerification,
          data: otpVerifyModel.toJson());
      log('Success verifOtpRegister');
      if (responce.success ?? false) {
        return Right(RegisterSuccessModel.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch verifOtpRegister $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponceModel>> forgotPassword(
      {required RestNewPassword restNewPassword}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.forgotPassword,
          data: restNewPassword.toJson());
      log('Success forgotPassword');
      if (responce.success ?? false) {
        return Right(SuccessResponceModel.fromResponse(responce));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch forgotPassword $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponceModel>> resetPassword(
      {required RestNewPassword restNewPassword}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.resetNewPassword,
          data: restNewPassword.toJson());
      log('Success resetPassword');
      if (responce.success ?? false) {
        return Right(SuccessResponceModel.fromResponse(responce));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch resetPassword $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
