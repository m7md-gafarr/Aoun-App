import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  final Dio dio = Dio();

  Future<ApiResponse<Map<String, dynamic>>> get({
    required String url,
  }) async {
    try {
      Response response = await dio.get(
        url,
      );

      return ApiResponseHandler.handleSuccess<Map<String, dynamic>>(response);
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }

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

  Future<ApiResponse<Map<String, dynamic>>> put({
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

      return ApiResponseHandler.handleSuccess<Map<String, dynamic>>(response);
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }
}
