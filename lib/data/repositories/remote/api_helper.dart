import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  final Dio dio = Dio();

  Future<ApiResponse<T>> get<T>({required String url}) async {
    try {
      Response response = await dio.get(url);

      if (response.data == null) {
        return ApiResponse<T>(
          success: false,
          errors: 'Empty response data',
          statusCode: response.statusCode,
        );
      }

      return ApiResponseHandler.handleSuccess<T>(response);
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<T>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<T>(e);
    }
  }

  Future<ApiResponse<T>> post<T>({
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

      return ApiResponseHandler.handleSuccess<T>(response);
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<T>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<T>(e);
    }
  }

  Future<ApiResponse<T>> put<T>({
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
      return ApiResponseHandler.handleSuccess<T>(response);
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<T>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<T>(e);
    }
  }
}
