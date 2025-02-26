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
    try {
      Response response = await dio.post(
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
        'success': false,
        'error': ["Unexpected error: ${e.message}"],
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
        'success': false,
        'error': ["Unexpected error: ${e.message}"],
      };
    }
  }
}
