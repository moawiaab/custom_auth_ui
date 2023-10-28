import 'package:dio/dio.dart';

class ApiServices {
  late Dio dio;

  late String token = "";
  late String appBaseUrl;

  ApiServices({required String appBaseUrl}) {
    BaseOptions options = BaseOptions(
      baseUrl: appBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      },
      contentType: "application/json",
    );
    dio = Dio(options);
  }

  Future<Response> postData(String url,
      {required dynamic body, Map<String, dynamic>? query}) async {
    try {
      Response response =
          await dio.post(url, data: body, queryParameters: query);
      print(response);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(
          statusCode: 1,
          statusMessage: e.toString(),
          requestOptions: RequestOptions());
    }
  }
}
