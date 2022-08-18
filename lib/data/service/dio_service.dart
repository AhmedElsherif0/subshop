import 'package:dio/dio.dart';

class DioService {
  static Dio? dio = Dio();

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: 60000,
        receiveTimeout: 60000,
        sendTimeout: 60000,
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, OPTIONS, PUT, PATCH, DELETE',
          'Access-Control-Allow-Headers': 'X-Requested-With,content-type',
          'Access-Control-Allow-Credentials': true
        }));
  }

  static Future<Response?> getResponse(
      {required String url,
      Map<String, dynamic>? queryParameters,
      String? lang = 'en',
      String? authorizationToken}) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': authorizationToken
    };
    return await dio?.get(url, queryParameters: queryParameters);
  }

  static Future<Response?> postResponseUrl({required String url, data}) async {
    return await dio?.post(url, data: data);
  }

  static Future<Response?> postResponse(
      {required String url,
      data,
      Map<String, dynamic> query = const {'': ''},
      String? lang = 'en',
      String? authorizationToken}) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': authorizationToken
    };
    return await dio?.post(url, data: data, queryParameters: query);
  }

  static Future<Response?> putResponse(
      {required String url,
      data,
      Map<String, dynamic> query = const {'': ''},
      String? lang = 'en',
      String? authorizationToken}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': authorizationToken
    };
    return await dio?.put(url, data: data, queryParameters: query);
  }
}
