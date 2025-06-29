import 'dart:developer';
import 'package:agent_dashboard/data/service/api_service.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/model/application/get_all_application_forms/data.dart';
import 'package:agent_dashboard/domain/model/application/get_detail_apllication_model/data.dart';
import 'package:agent_dashboard/domain/model/auth/register_success_model/register_success_model.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/repository/appliction_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;

class ApplicationService implements ApplictionRepo {
  final ApiService _apiService = ApiService();

  @override
  Future<Either<Failure, RegisterSuccessModel>> studentApplicationFormSubmit(
      {required dio.FormData formdata}) async {
    try {
      final responce = await _apiService.post(
          headers: {'Content-Type': 'multipart/form-data'},
          ApiEndPoints.studentApplication,
          data: formdata);
      log('Success studentApplicationFormSubmit -> ${responce.data}');
      if (responce.success ?? false) {
        return Right(RegisterSuccessModel.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch studentApplicationFormSubmit $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterSuccessModel>> intakeFormSubmit(
      {required dio.FormData formdata, required String applicationID}) async {
    try {
      final responce = await _apiService.post(
          headers: {'Content-Type': 'multipart/form-data'},
          ApiEndPoints.intakeForm.replaceFirst('{id}', applicationID),
          data: formdata);
      log('Success intakeFormSubmit -> ${responce.data}');
      if (responce.success ?? false) {
        return Right(RegisterSuccessModel.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch intakeFormSubmit $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetDetailApplicationData>> detailApplication(
      {required String id}) async {
    try {
      final responce = await _apiService
          .get(ApiEndPoints.detailStudentApplication.replaceFirst('{id}', id));
      log('Success detailApplication -> ${responce.data}');
      if (responce.success ?? false) {
        return Right(GetDetailApplicationData.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch detailApplication $e');
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApplicationData>> getAllApplicationForms() async {
    try {
      final responce =
          await _apiService.get(ApiEndPoints.allStudentApplication);
      log('Success getAllApplicationForms -> ${responce.data}');
      if (responce.success ?? false) {
        return Right(ApplicationData.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch getAllApplicationForms $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
