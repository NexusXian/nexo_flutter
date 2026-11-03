import 'package:dio/dio.dart';
import 'package:nexo_flutter/constants/http.dart';

// wrap the dio methods to handle the response and error
class DioRequest {
  final Dio _dio = Dio();
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.baseUrl
      ..connectTimeout = Duration(milliseconds: GlobalConstants.connectTimeout)
      ..sendTimeout = Duration(milliseconds: GlobalConstants.connectTimeout)
      ..receiveTimeout = Duration(milliseconds: GlobalConstants.connectTimeout);
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          //to be completed: add token to header
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 || response.statusCode! < 300) {
            handler.next(response);
          } else {
            handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  // wrap the dio methods to handle the response and error
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    return _handlerResponse(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) async {
    return _handlerResponse(_dio.post(url, data: data));
  }

  Future<dynamic> put(String url, {Map<String, dynamic>? data}) async {
    return _handlerResponse(_dio.put(url, data: data));
  }

  Future<dynamic> delete(String url, {Map<String, dynamic>? data}) async {
    return _handlerResponse(_dio.delete(url, data: data));
  }

  Future<dynamic> _handlerResponse(Future<Response<dynamic>> task) async {
    Response<dynamic> res = await task;
    final data = res.data as Map<String, dynamic>;
    if (data.containsKey("code") &&
        data["code"] == GlobalConstants.sucessCode) {
      return data["result"];
    }
    throw Exception(data["msg"] ?? '加载数据异常');
  }
}

final dioRequest = DioRequest();
