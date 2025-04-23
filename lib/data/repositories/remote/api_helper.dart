import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  final Dio dio = Dio();

  Future get({
    required String url,
  }) async {
    try {
      Response response = await dio.get(
        url,
      );
      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        return {
          'successed': false,
          'errors': ["${response.data}"],
        };
      }
    } on DioException catch (e) {
      return {
        'successed': false,
        'errors': ["Network error: ${e.response?.data}"],
      };
    } catch (e) {
      return {
        'successed': false,
        'errors': ["Unexpected error get: $e"],
      };
    }
  }

  // Future<Map<String, dynamic>> post({
  //   required String url,
  //   required Map<String, dynamic> body,
  //   required Map<String, String> headers,
  // }) async {
  //   try {
  //     Response response = await dio.post(
  //       url,
  //       data: body,
  //       options: Options(headers: headers),
  //     );
  //     return response.data as Map<String, dynamic>;
  //   } on DioException catch (e) {
  //     if (e.response!.statusCode == 400 || e.response!.statusCode == 401) {
  //       return e.response!.data as Map<String, dynamic>;
  //     } else {
  //       return {
  //         'successed': false,
  //         'errors': ["${e.response?.data}"],
  //       };
  //     }
  //   } catch (e) {
  //     return {
  //       'successed': false,
  //       'errors': ["$e"],
  //     };
  //   }
  // }

  Future<ApiResponse<Map<String, dynamic>>> post({
    required String url,
    required dynamic body,
    required Map<String, String> headers,
  }) async {
    try {
      Response response = await dio.post(
        url,
        data: body,
        options: Options(headers: headers),
      );

      return ApiResponseHandler.handleSuccess<Map<String, dynamic>>(response);
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
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
