class Failure {
  String? message;
  String? subMessage;
  int? statusCode;
  dynamic data;
  Failure({this.message, this.data, this.subMessage, this.statusCode});
}

const String errorMessage = 'Something Went wrong';
