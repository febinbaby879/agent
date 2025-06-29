import 'package:agent_dashboard/domain/model/application/get_all_application_forms/data.dart';
import 'package:agent_dashboard/domain/model/application/get_detail_apllication_model/data.dart';
import 'package:agent_dashboard/domain/model/auth/register_success_model/register_success_model.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;

abstract class ApplictionRepo {
  Future<Either<Failure, RegisterSuccessModel>> studentApplicationFormSubmit(
      {required dio.FormData formdata});
  Future<Either<Failure, RegisterSuccessModel>> intakeFormSubmit(
      {required dio.FormData formdata, required String applicationID});
  Future<Either<Failure, ApplicationData>> getAllApplicationForms();
  Future<Either<Failure, GetDetailApplicationData>> detailApplication(
      {required String id});
}
