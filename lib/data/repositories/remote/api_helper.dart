import 'package:dio/dio.dart';

class ApiHelper {
  final Dio dio = Dio();

  Future get({
    required String url,
  }) async {
    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(" You have a problem in ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        print("Request: ${options.method} ${options.path}");
        print("Headers: ${options.headers}");
        print("Body: ${options.data}");
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        print("Response: ${response.statusCode} ${response.statusMessage}");
        print("Data: ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        print("Error: ${e.message}");
        return handler.next(e);
      },
    ));
    try {
      Response response = await dio.post(
        url,
        data: body,
        options: Options(headers: headers),
      );

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response!.statusCode == 400 || e.response!.statusCode == 401) {
        return e.response!.data as Map<String, dynamic>;
      } else {
        return {
          'successed': false,
          'errors': ["Network error: ${e.response?.data}"],
        };
      }
    } catch (e) {
      return {
        'successed': false,
        'errors': ["Unexpected error post: $e"],
      };
    }
  }

  Future<Map<String, dynamic>> put({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> headers,
  }) async {
    try {
      Response response = await dio.put(
        url,
        data: body,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        return response.data as Map<String, dynamic>;
      }
    } on DioException catch (e) {
      return {
        'successed': false,
        'errors': ["Unexpected error: ${e.message}"],
      };
    }
  }
}
