import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shopping_app/utils/dio_util/api_exception.dart';

// 自定义封装 dio 网络请求配置
class DioConfig {
  static const baseURL = "http://47.108.167.244:10010";
  // static const connectTimeOut = 10000;
  // static const readTimeOut = 10000;
  // static const writeTimeOut = 10000;
  static const successCode = 200;
}

DioRequest dioRequest = DioRequest();

class DioRequest {
  static Dio _dio = Dio();
  static final DioRequest _singletonRequestClient = DioRequest._internal();

  factory DioRequest() {
    return _singletonRequestClient;
  }

  DioRequest._internal() {
    // 初始化基本选项
    BaseOptions options = BaseOptions(
      baseUrl: DioConfig.baseURL,
      // connectTimeout: DioConfig.connectTimeOut,
      // sendTimeout: DioConfig.readTimeOut,
      // receiveTimeout: DioConfig.writeTimeOut
    );

    // 初始化dio
    _dio = Dio(options);

    // 添加拦截器
    // _dio.interceptors.add(DioInterceptors());
  }

  Future request<T>(
    String url, {
    required String method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headers,
    bool Function(ApiException)? onError, //用于错误信息处理的回调
  }) async {
    try {
      Options options = Options()
        ..method = method
        ..headers = headers;

      data = _convertRequestData(data);

      Response response = await _dio.request(url,
          queryParameters: queryParameters, data: data, options: options);

      return response.data;
    } catch (e) {
      ///创建 ApiException ，调用 onError，当 onError 返回为 true 时即错误信息已被调用方处理，则不抛出异常，否则抛出异常。
      var exception = ApiException.from(e);
      if (onError?.call(exception) != true) {
        throw exception;
      }
    }
    return null;
  }

  // 将请求 data 数据先使用 jsonEncode 转换为字符串，再使用 jsonDecode 方法将字符串转换为 Map
  _convertRequestData(data) {
    if (data != null) {
      data = jsonDecode(jsonEncode(data));
    }
    return data;
  }

  // 请求响应内容处理
  // T? _handleResponse<T>(Response response) {
  //   if (response.statusCode == 200) {
  //     ApiResponse<T> apiResponse = ApiResponse<T>.fromJson(response.data, (e) {
  //       return e;
  //     });
  //     return _handleBusinessResponse<T>(apiResponse);
  //     // return jsonDecode(response.data);
  //   } else {
  //     var exception =
  //         ApiException(response.statusCode, ApiException.unknownException);
  //     throw exception;
  //   }
  // }

  // // 业务内容处理
  // T? _handleBusinessResponse<T>(ApiResponse response) {
  //   if (response.code == DioConfig.successCode) {
  //     return response.data;
  //   } else {
  //     var exception = ApiException(response.code, response.msg);
  //     throw exception;
  //   }
  // }

  Future get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        method: "GET",
        queryParameters: queryParameters,
        headers: headers,
        onError: onError);
  }

  Future post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        method: "POST",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  Future delete<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        method: "DELETE",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

  Future put<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    bool showLoading = true,
    bool Function(ApiException)? onError,
  }) {
    return request(url,
        method: "PUT",
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }
}
