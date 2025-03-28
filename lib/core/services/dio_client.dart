import 'package:dio/dio.dart';
import 'package:person_plan/core/constants/api_const.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/core/services/shared_pref.dart';
import 'package:person_plan/di/injection_container.dart';

class DioClient {
  late final Dio _dio;
  final String _baseUrl = ApiConst.baseUrl;

  // Constructor to initialize Dio with options and interceptor
  DioClient() : _dio = Dio() {
    _dio.options = _dioOptions();
    _dio.interceptors.add(_CustomInterceptor());
  }

  BaseOptions _dioOptions() {
    return BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: {"Accept": "application/json"},
    );
  }

  Dio get client => _dio;
}

// Custom Interceptor class
class _CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // Add authentication token if available
      String token = serviceLocator<SharedPref>().bearerToken;
      if (token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      // Add app version to headers (Optional)
      options.headers['app-version'] = serviceLocator<SharedPref>().appVersion;

      // Log request details
      printLog('REQUEST[${options.method}] => PATH: ${options.path}');
      printLog('Headers: ${options.headers}');
      if (options.data != null) {
        printLog('Body: ${options.data}');
      }
    } catch (e) {
      printError('Error in onRequest: $e');
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log response details
    printLog('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    printLog('Data: ${response.data}');

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Log error details
    printError('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    printError('Message: ${err.message}');
    if (err.response != null) {
      printError('Error Data: ${err.response?.data}');
    }

    // Handle specific error cases
    switch (err.response?.statusCode) {
      case 401:
        printError('Unauthorized - Token might be expired');
        break;
      case 403:
        printError('Forbidden - User lacks permission');
        break;
      case 500:
        printError('Server error');
        break;
      default:
        printError('Unknown error occurred');
    }

    return handler.next(err);
  }
}
