import 'package:dio/dio.dart';

abstract class RemoteContriesDataSource {
  Future<Response> get({required String endPoint});
  Future<Response> post({
    Map<String, dynamic>? data,
    required String endPoint,
    String? contentTyp,
  });
}

class RemoteContriesDataSourceImp extends RemoteContriesDataSource {
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
  Future<Response> post(
      {Map<String, dynamic>? data,
      required String endPoint,
      String? contentTyp}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
