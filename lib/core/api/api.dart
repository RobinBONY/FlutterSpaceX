import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class Api {
  Dio _dio;

  Api() {
    _dio = Dio();
    _dio.options = BaseOptions(baseUrl: "https://api.spacexdata.com");
  }

  Future<Response<List<dynamic>>> getUpcomingLaunches() async =>
      await _dio.get<List<dynamic>>("/v4/launches/upcoming");

  Future<Response<List<dynamic>>> getHistoryLaunches() async =>
      await _dio.get<List<dynamic>>("/v4/launches/past");

  Future<Response<List<dynamic>>> getLaunchPads() async =>
      await _dio.get<List<dynamic>>("/v3/launchpads");
}
