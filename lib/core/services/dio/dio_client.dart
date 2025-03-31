import 'package:dio/dio.dart';
import 'package:person_plan/core/constants/api_const.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';

part 'dio_interceptors.dart';

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
