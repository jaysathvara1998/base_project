import 'package:base_project/core/network/api_constant.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio})
      : _dio = dio ??
      Dio(
        BaseOptions(
          baseUrl: ApiConstants.baseUrl, // Default base URL
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      ) {
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  /// Generic GET method
  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(url, queryParameters: params);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow; // Allows callers to handle the error
    }
  }

  /// Generic POST method
  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// Error handling
  void _handleDioError(DioException e) {
    if (e.response != null) {
      // API responded with an error
      throw ServerException(
        message: e.response?.data['message'] ?? 'Something went wrong',
        statusCode: e.response?.statusCode,
      );
    } else {
      // No response (e.g., network error)
      throw ServerException(
        message: e.message ?? 'Unable to connect to the server',
      );
    }
  }
}

/// Custom exception class
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException({required this.message, this.statusCode});

  @override
  String toString() => 'ServerException: $message (status code: $statusCode)';
}
