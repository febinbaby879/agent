import 'package:agent_dashboard/data/shared_preference/shared_preferences.dart';
import 'package:agent_dashboard/domain/core/endpoints/endpoints.dart';
import 'package:agent_dashboard/domain/model/commen/api_response/api_response.dart';

import 'dart:developer';
import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  );

  ApiService({bool addToken = true}) {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (addToken) {
          final token = await SharedPreferecesStorage.getAccessToken();
          if (token != null) {
            options.headers['authorization'] = 'Bearer $token';
          }
        }
        return handler.next(options);
      },
    ));
  }

  Future<ApiResponse> get(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      bool addHeader = true}) async {
    try {
      final response = await _dio.get(url,
          queryParameters: queryParameters, options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      log('GET Exception => $e');
      return ApiResponse.error();
    }
  }

  Future<ApiResponse> post(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      dynamic data,
      bool addHeader = true}) async {
    try {
      final response = await _dio.post(url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      log('POST Exception => $e');
      return ApiResponse.error();
    }
  }

  Future<ApiResponse> put(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      dynamic data,
      bool addHeader = true}) async {
    try {
      final response = await _dio.put(url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      log('PUT Exception => $e');
      return ApiResponse.error();
    }
  }

  Future<ApiResponse> delete(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      dynamic data,
      bool addHeader = true}) async {
    try {
      final response = await _dio.delete(url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      log('DELETE Exception => $e');
      return ApiResponse.error();
    }
  }

  Future<ApiResponse> patch(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      dynamic data,
      bool addHeader = true}) async {
    try {
      final response = await _dio.patch(url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return _handleResponse(response);
    } catch (e) {
      log('PATCH Exception => $e');
      return ApiResponse.error();
    }
  }

  ApiResponse _handleResponse(Response response) {
    try {
      final data = response.data;
      if (data is List) {
        return ApiResponse(data: data);
      }
      return ApiResponse.fromJson(data);
    } catch (e) {
      return ApiResponse.error(response.data, response.statusCode);
    }
  }

  Future<bool> downloadFile({
    required String url,
    required String savePath,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      await _dio.download(
        url,
        savePath,
        onReceiveProgress: onReceiveProgress,
      );
      return true;
    } catch (e) {
      log('Error downloading file: $e');
      return false;
    }
  }
}
