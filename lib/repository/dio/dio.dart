import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

Dio createDio() {
  final dio = Dio(_createBaseOptions());

  dio.interceptors.add(AuthInterceptor(dio));
  dio.interceptors.add(Logging(dio));
  return dio;
}

BaseOptions _createBaseOptions() => BaseOptions(
      // Request base url
      baseUrl: "https://gogreen-ezea7fgm5q-du.a.run.app",

      // Timeout in milliseconds for receiving data
      receiveTimeout: const Duration(seconds: 15),

      // Timeout in milliseconds for sending data
      sendTimeout: const Duration(seconds: 15),

      // Timeout in milliseconds for opening url
      connectTimeout: const Duration(seconds: 5),
    );

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
    options.headers['Authorization'] = 'Bearer $idToken';
    return handler.next(options);
  }
}

class Logging extends Interceptor {
  final Dio dio;

  Logging(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String query = '';
    options.queryParameters.forEach((key, value) {
      query += '$key=$value&';
    });
    print('REQUEST[${options.method}] => PATH: ${options.path}?$query');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String query = '';
    response.requestOptions.queryParameters.forEach((key, value) {
      query += '$key=$value&';
    });
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}?$query',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    String query = '';
    err.requestOptions.queryParameters.forEach((key, value) {
      query += '$key=$value&';
    });
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}?$query',
    );
    print(err.response?.data ?? err.message);
    return super.onError(err, handler);
  }
}

// 나중에 필요하면 쓰는걸로
class ErrorInterceptor extends Interceptor {
  final Dio dio;

  ErrorInterceptor(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("error: ${err.response?.statusCode}");
    if (err.response != null &&
        err.response!.statusCode == 200 &&
        err.response!.data is String) {
      try {
        final jsonData = json.decode(err.response!.data);
        print(jsonData); // 디버깅용 출력
      } on Exception catch (_) {
        // ignore
      }
    }
    return handler.next(err);
  }
}
