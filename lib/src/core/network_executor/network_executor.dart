import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:fahad_flutter/src/core/network_executor/network_response.dart';
import 'package:get/get.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkCaller {
  static final dio.Dio _dio = dio.Dio(dio.BaseOptions(
    connectTimeout: const Duration(seconds: 300),
    receiveTimeout: const Duration(seconds: 300),
  ))
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

  static Future<NetworkResponse> getRequest(String path,
      {Map<String, dynamic>? queryParams, bool isLogin = true}) async {
    return _handleRequest(
          () async => _dio.get(
        path,
        queryParameters: queryParams,
        options: dio.Options(headers: await _defaultHeaders(isLogin: isLogin)),
      ),
    );
  }
  static Future<NetworkResponse> postRequest(String path, {dynamic body, bool isLogin = true}) async {
    return _handleRequest(
          () async => _dio.post(
        path,
        data: body,
        options: dio.Options(headers: await _defaultHeaders(isLogin: isLogin)),
      ),
    );
  }



  static Future<NetworkResponse> putRequest(String path,
      {Map<String, dynamic>? body, bool isLogin = true}) async {
    return _handleRequest(
          () async => _dio.put(
        path,
        data: jsonEncode(body ?? {}),
        options: dio.Options(headers: await _defaultHeaders(isLogin: isLogin)),
      ),
    );
  }

  static Future<NetworkResponse> patchRequest(String path,
      {Map<String, dynamic>? body, bool isLogin = true}) async {
    return _handleRequest(
          () async => _dio.patch(
        path,
        data: jsonEncode(body ?? {}),
        options: dio.Options(headers: await _defaultHeaders(isLogin: isLogin)),
      ),
    );
  }

  static Future<NetworkResponse> deleteRequest(String path,
      {Map<String, dynamic>? body, bool isLogin = true}) async {
    return _handleRequest(
          () async => _dio.delete(
        path,
        data: jsonEncode(body ?? {}),
        options: dio.Options(headers: await _defaultHeaders(isLogin: isLogin)),
      ),
    );
  }

  static Future<NetworkResponse> _handleRequest(
      Future<dio.Response> Function() request) async {
    try {
      final dio.Response response = await request();
      _logResponse(response);

      final int statusCode = response.statusCode ?? -1;

      if (statusCode == 401) {
       // _handleUnauthorized();
        return NetworkResponse(
          isSuccess: false,
          status: false,
          statusCode: statusCode,
          message: 'Unauthorized. Redirecting to login.',
        );
      }

      return NetworkResponse(
        isSuccess: statusCode == 200,
        status: response.data['status'] ?? false,
        statusCode: statusCode,
        data: response.data,
        message: response.data['message'] ?? response.statusMessage ?? 'Request completed',
      );
    } catch (e) {
      if (e is dio.DioException) {
        if (e.response?.statusCode == 401) {
         // _handleUnauthorized();
          return NetworkResponse(
            isSuccess: false,
            status: false,
            statusCode: 401,
            message: 'Unauthorized. Redirecting to login.',
          );
        }

        return NetworkResponse(
          isSuccess: false,
          status: false,
          statusCode: e.response?.statusCode ?? -1,
          data: e.response?.data,
          message: e.message.toString(),
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          status: false,
          statusCode: -1,
          message: 'An unexpected error occurred',
        );
      }
    }
  }



  static Future<Map<String, String>> _defaultHeaders({bool isLogin = true}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // if (isLogin) {
    //   String? token = await LocalData.getToken();
    //   if (token != null && token.isNotEmpty) {
    //     headers['Authorization'] = 'Bearer $token';
    //   }
    // }

    return headers;
  }

  static void _logResponse(dio.Response response) {
    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.data}');
  }

  // static void _handleUnauthorized() {
  //   log('Handling unauthorized access');
  //   Get.offAll(()=> LoginScreen());
  //   //LoginController.clear();
  //   LocalData.clearAll();
  // }
}
