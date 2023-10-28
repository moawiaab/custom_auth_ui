// ignore: file_names
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token = "";
  late String appBaseUrl;

  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    _mainHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  _updateHeader() {
    _mainHeaders = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  setToken(String token) {
    this.token = token;
    _updateHeader();
  }

  Future<Response> getData(String url, {Map<String, dynamic>? query}) async {
    try {
      Response response = await get(url, query: query, headers: _mainHeaders);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String url,
      {required dynamic body, Map<String, dynamic>? query}) async {
    try {
      Response response =
          await post(url, body, headers: _mainHeaders, query: query);
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(String url,
      {required dynamic body, Map<String, dynamic>? query}) async {
    try {
      Response response =
          await put(url, body, headers: _mainHeaders, query: query);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteItem(
      {required String url, Map<String, dynamic>? query}) async {
    try {
      Response response =
          await delete(url, headers: _mainHeaders, query: query);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
