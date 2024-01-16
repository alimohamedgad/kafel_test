import 'package:dio/dio.dart';

abstract class RemoteUserDataSource {
  Future<Response> get();
  Future<Response> post({
    Map<String, dynamic>? data,
    required String endPoint,
    String? contentTyp,
  });
}

class RemoteUserDataSourceImp extends RemoteUserDataSource {
  @override
  Future<Response> post({
    Object? data,
    required String endPoint,
    String? contentTyp,
  }) async {
    return await Dio().post(
      endPoint,
      queryParameters: {
        "Content-Type": contentTyp,
        "Accept": "application/json",
        "Accept-Language": "ar",
      },
      data: data,
    );
  }

  @override
  Future<Response> get() {
    // TODO: implement get
    throw UnimplementedError();
  }
}
