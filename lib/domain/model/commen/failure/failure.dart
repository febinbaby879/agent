import 'package:agent_dashboard/domain/model/commen/api_response/api_response.dart';

class Failure {
  String? message;
  int? statusCode;
  dynamic data;
  Failure({this.message, this.data, this.statusCode});
  factory Failure.fromApiResponse(ApiResponse responce) =>
      Failure(message: responce.message, data: responce.data);
}

const String errorMessage = 'Something Went wrong';
