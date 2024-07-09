import 'dart:developer';

import 'package:dio/dio.dart';

abstract class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://admin.housemadecom.com/api/mobile/',
        receiveDataWhenStatusError: true,
      ),
    )..interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
        request: true,
        responseHeader: true,
        error: true,
        requestHeader: true,
        logPrint: (object) {
          log(object.toString());
        },
      ));
  }

  static Future<Response> getData({
    required String path,
  }) async {
    return await dio.get(
      path,
      options: Options(headers: {
        'language': 'ar',
      }),
    );
  }
}
