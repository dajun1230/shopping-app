import 'package:dio/dio.dart';

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 头部添加token
    options.headers["token"] = "xxxx";

    handler.next(options);

    // super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    handler.next(response);

    // super.onResponse(response, handler);
  }
}
