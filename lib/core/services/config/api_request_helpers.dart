import 'dart:async';
import 'dart:convert';

import 'package:busha_mobile_test/core/services/config/_export_.dart';
import 'package:busha_mobile_test/utils/app_logger.dart';
import 'package:busha_mobile_test/utils/connection_status.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiRequestHelpers {
  final Dio dio;
  final String baseUrl;

  ApiRequestHelpers({
    required this.dio,
    required this.baseUrl,
  }) {
    initClient(baseUrl);
  }

  void initClient(baseUrl) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 200), // 60 * 1000, // 60 seconds
      receiveTimeout: const Duration(seconds: 200), // 60 seconds
    );

    dio.options = options;

    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (
        options,
        handler,
      ) async {
        if (!await ConnectionStatus.isConnected()) {
          handler.reject(
            DioException(
              requestOptions: options,
              error:
                  "Oops! Looks like you're not connected to the internet. Check your internet connection and try again.",
            ),
          );
        } else {
          handler.next(options);
        }
      }, onResponse: (response, handler) async {
        handler.next(response);
      }, onError: (error, handler) async {
        handler.next(error);
      }),
    );

    // Check if app on debug mode to show logs.
    if (kDebugMode && AppLogger.showLogs) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
  }

  ApiRequestHelpers.test({
    required this.dio,
    required this.baseUrl,
  });

  Future<Either<Failure, Success>> get(path,
      {Map<String, dynamic>? data,
      Map<String, dynamic> headers = const {},
      bool isFetchDataInIsolate = false}) async {
    return makeRequest(
      path: path,
      requestMethod: "GET",
      requestData: data,
      isFetchDataInIsolate: isFetchDataInIsolate,
      headers: {
        ...headers,
      },
    );
  }

  Future<Either<Failure, Success>> post(
    path, {
    bool useToken = false,
    dynamic data,
    Map<String, dynamic> headers = const {},
    Map<String, dynamic>? customAuthHeader,
  }) async {
    return makeRequest(
      path: path,
      requestMethod: "POST",
      requestData: data is Map
          ? {
              ...data,
            }
          : data,
      headers: {
        ...headers,
      },
    );
  }

  Future<Either<Failure, Success>> makeRequest(
      {required dynamic requestData,
      required Map<String, dynamic>? headers,
      required String path,
      required String requestMethod,
      bool isFetchDataInIsolate = false}) async {
    try {
      Response? req;
      if (requestMethod == "POST") {
        req = await dio.post(
          path,
          data: requestData,
          options: Options(
            headers: headers,
          ),
        );
      }
      if (requestMethod == "GET") {
        if (isFetchDataInIsolate) {
        } else {
          req = await dio.request(
            path,
            data: requestData,
            options: Options(
              method: "GET",
              contentType: 'application/json',
              headers: headers,
            ),
          );
        }
      }

      dynamic data;
      if (req!.data is Map) {
        data = req.data as Map<dynamic, dynamic>;
      } else {
        data = req.data;
      }

      AppLogger.log(req.data);

      var responseRedefined = data;
      if ("${req.statusCode}".startsWith('2')) {
        return Right(Success(responseRedefined));
      } else {
        return Left(
          Failure(
            ApiErrorResponse(
              data: responseRedefined,
              errorCode: req.statusCode,
            ),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.unknown) {
        return Left(
          Failure(
            ApiErrorResponse(
              data: {"responseMessage": e.message.toString()},
            ),
          ),
        );
      }

      if (e.response != null) {
        if (e.response?.statusCode == 503 || e.response?.statusCode == 502) {
          return Left(
            Failure(
              const ApiErrorResponse(
                data: {
                  "responseMessage":
                      "Service unavailable at the moment,\nplease try again later !!!",
                },
              ),
            ),
          );
        }

        if (e.response?.data != null && e.response!.data is Map) {
          return Left(
            Failure.fromMap(e.response!.data as Map<String, dynamic>),
          );
        }

        return Left(
          Failure(
            ApiErrorResponse(
              errorCode: e.response?.statusCode,
              data: const {
                "responseMessage":
                    "Service unavailable at the moment,\nplease try again later !!!",
              },
            ),
          ),
        );
      } else {
        // Something happened in setting up or sending the request that triggered an Error

        return Left(
          Failure(
            ApiErrorResponse(
              errorCode: e.response?.statusCode,
              data: const {
                "responseMessage":
                    "Service unavailable at the moment,\nplease try again later !!!",
              },
            ),
          ),
        );
      }
    }
  }

  Future<void> fetchDataAndProcessInIsolate({
    required String path,
    required Map<String, dynamic> headers,
    required Function(Map<String, dynamic>) callback,
  }) async {
    final Map<String, dynamic> params = {
      'path': path,
      'headers': headers,
    };

    try {
      final result = await compute(fetchDataAndProcess, params);
      callback(result);
    } catch (e) {
      print('Error in compute: $e');
    }
  }

  Future<Map<String, dynamic>> fetchData(String url) async {
    final response = await http.get(
      Uri.parse(
          "https://blockchain.info/rawblock/0000000000000000000211e6f723b6cff822f32888bc9aa5b35899a5d7249e35"),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return {'tx': data['tx']};
    } else {
      throw Exception('Failed to load data');
    }
  }

  // void entryPoint(SendPort sendPort) async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(
  //           "https://blockchain.info/rawblock/0000000000000000000211e6f723b6cff822f32888bc9aa5b35899a5d7249e35"),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       Map<String, dynamic> map = {'tx': data['tx']};
  //       sendPort.send(map);
  //     } else {
  //       sendPort.send({'error': 'Failed to load data'});
  //     }
  //   } catch (e) {
  //     sendPort.send({'error': e.toString()});
  //   }
  // }

  Future<Map<String, dynamic>> fetchDataAndProcess(
      Map<String, dynamic> params) async {
    final Dio dio = Dio();
    final String path = params['path'];
    final Map<String, dynamic> headers = params['headers'];

    try {
      final Response response = await dio.get(
        path,
        options: Options(
          headers: headers,
          contentType: 'application/json',
        ),
      );

      // Process data
      Map<String, dynamic> data = response.data;
      print(data);
      data['tx'] =
          (data['tx'] as List).take(10).toList(); // Limit to 10 transactions

      return {'status': 'success', 'data': data};
    } catch (e) {
      return {'status': 'error', 'message': e.toString()};
    }
  }
}
