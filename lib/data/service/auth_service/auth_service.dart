import 'dart:developer';
import 'package:agent_dashboard/data/service/api_service.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:agent_dashboard/domain/model/auth/get_user_model/get_user_model.dart';
import 'package:agent_dashboard/domain/model/auth/login/login_model/login_model.dart';
import 'package:agent_dashboard/domain/model/auth/otp_verify_model/otp_verify_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_model/register_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_success_model/register_success_model.dart';
import 'package:agent_dashboard/domain/model/auth/reset_password_model/reset_password_model.dart';
import 'package:agent_dashboard/domain/model/auth/update_user_model/update_user_model.dart';
import 'package:agent_dashboard/domain/model/success_responce_model/success_responce_model.dart';
import 'package:agent_dashboard/domain/repository/auth.dart';
import 'package:dio/dio.dart' as dio;

class AuthService implements AuthRepo {
  final ApiService apiService = ApiService();
  @override
  Future<Either<Failure, RegisterSuccessModel>> userLogin(
      {required LoginModel loginModel}) async {
    try {
      final responce = await apiService.post(ApiEndPoints.userLogin,
          data: loginModel.toJson());
      log('Success userLogin');
      return Right(RegisterSuccessModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException userLogin $e');
      return Left(Failure(message: e.message ?? errorMessage));
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
      return Right(RegisterSuccessModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException userRegister $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch userRegister $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetUserModel>> getUser() async {
    try {
      final responce = await apiService.get(ApiEndPoints.getUser);
      log('Success getUser');
      return Right(GetUserModel.fromJson(responce.data));
    } on DioException catch (e) {
      log('DioException getUser $e');
      return Left(Failure(message: e.message ?? errorMessage));
    } catch (e) {
      log('catch getUser $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponceModel>> updateUser({
    required UpdateUserModel updateUserModel,
  }) async {
    try {
      // Make the PUT request
      final response = await apiService.put(ApiEndPoints.updateUser,
          data: updateUserModel.toJson());
      log('Success: updateUser');
      return Right(SuccessResponceModel.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException: updateUser $e');
      return Left(Failure(message: e.message ?? 'An error occurred'));
    } catch (e) {
      log('Catch error: updateUser $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponceModel>> resetPassword(
      {required ResetPasswordModel resetPassword}) async {
    try {
      final response = await apiService.post(ApiEndPoints.resetPassword,
          data: resetPassword.toJson());
      log('Success: resetPassword');
      return Right(SuccessResponceModel.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException: resetPassword $e');
      return Left(Failure(message: e.message ?? 'An error occurred'));
    } catch (e) {
      log('Catch error: resetPassword $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponceModel>> oTPSending(
      {required String email}) async {
    try {
      final response = await apiService
          .post(ApiEndPoints.oTPSending, data: {"email": email});
      log('Success: oTPSending');
      return Right(SuccessResponceModel.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException: oTPSending $e');
      return Left(Failure(message: e.message ?? 'An error occurred'));
    } catch (e) {
      log('Catch error: oTPSending $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponceModel>> verifyResetPasswordOTP(
      {required OtpVerifyModel otpVerify}) async {
    try {
      final response = await apiService.post(ApiEndPoints.oTPVerify,
          data: otpVerify.toJson());
      log('Success: verifyResetPasswordOTP');
      return Right(SuccessResponceModel.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException: verifyResetPasswordOTP $e');
      return Left(
          Failure(message: e.response?.statusMessage ?? 'An error occurred'));
    } catch (e) {
      log('Catch error: verifyResetPasswordOTP $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponceModel>> accountSoftDelete(
      {required String userId}) async {
    try {
      final response = await apiService.put(
          ApiEndPoints.accountSoftDelete.replaceFirst('{user_ud}', userId));
      log('Success: accountSoftDelete');
      return Right(SuccessResponceModel.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException: accountSoftDelete $e');
      return Left(
          Failure(message: e.response?.statusMessage ?? 'An error occurred'));
    } catch (e) {
      log('Catch error: accountSoftDelete $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SuccessResponceModel>> contactUS(
      {required dio.FormData formData}) async {
    try {
      final response =
          await apiService.post(ApiEndPoints.formSubmission, data: formData);
      log('Success: contactUS');
      return Right(SuccessResponceModel.fromJson(response.data));
    } on DioException catch (e) {
      log('DioException: contactUS $e');
      return Left(
          Failure(message: e.response?.statusMessage ?? 'An error occurred'));
    } catch (e) {
      log('Catch error: contactUS $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
