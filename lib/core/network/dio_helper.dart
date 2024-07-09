import 'package:dio/dio.dart';

abstract class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://admin.housemadecom.com/api/mobile/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path,
  }) async {
    return await dio.get(
      path,
    );
  }
}
