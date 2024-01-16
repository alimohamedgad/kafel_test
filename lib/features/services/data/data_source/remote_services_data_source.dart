import 'package:dio/dio.dart';

abstract class RemoteServicesDataSource {
  Future<Response> get({required String endPoint});
  Future<Response> post({
    Map<String, dynamic>? data,
    required String endPoint,
    String? contentTyp,
  });
}

class RemoteServicesDataSourceImp extends RemoteServicesDataSource {
  @override
  Future<Response> get({required String endPoint}) async {
    return await Dio().get(
      endPoint,
      queryParameters: {
        "Accept": "application/json",
        "Accept-Language": "ar",
      },
    );
  }

  @override
  Future<Response> post({
    Map<String, dynamic>? data,
    required String endPoint,
    String? contentTyp,
  }) async {
    return await Dio().post(
      endPoint,
      queryParameters: {
        "Accept": "application/json",
        "Accept-Language": "ar",
      },
      data: data,
    );
  }
}
