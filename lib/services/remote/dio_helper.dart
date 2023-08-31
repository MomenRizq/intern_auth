import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com/auth/',
        receiveDataWhenStatusError: true,
        followRedirects: true,
        maxRedirects: 5,

      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

}