import 'dart:developer';
import 'package:agent_dashboard/data/service/api_service.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:agent_dashboard/domain/model/auth/login/login_model/login_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_model/register_model.dart';
import 'package:agent_dashboard/domain/model/auth/register_success_model/register_success_model.dart';
import 'package:agent_dashboard/domain/repository/auth.dart';

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
        return Left(Failure.fromApiResponse(responce));
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
        return Left(Failure.fromApiResponse(responce));
      }
    } catch (e) {
      log('catch userRegister $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
