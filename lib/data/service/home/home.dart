import 'dart:developer';
import 'package:agent_dashboard/data/service/api_service.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/model/commen/failure/failure.dart';
import 'package:agent_dashboard/domain/model/course_model/data.dart';
import 'package:agent_dashboard/domain/repository/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeService implements HomeRepo {
  final ApiService _apiService = ApiService(addToken: false);

  @override
  Future<Either<Failure, CourseData>> getCourse() async {
    try {
      final responce = await _apiService.get(ApiEndPoints.getCourses);
      log('Success getCourse -> ');
      if (responce.success ?? false) {
        log('Corsm >>> ${responce.data.toString()}');
        return Right(CourseData.fromJson(responce.data));
      } else {
        return Left(Failure.fromResponse(responce));
      }
    } catch (e) {
      log('catch getCourse $e');
      return Left(Failure(message: e.toString()));
    }
  }
}
