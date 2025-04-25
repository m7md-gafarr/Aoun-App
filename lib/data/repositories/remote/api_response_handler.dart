import 'package:dio/dio.dart';

class ApiResponse<T> {
  final bool success;
  final T? data;
  final String errors;
  final int? statusCode;

  ApiResponse({
    required this.success,
    this.data,
    this.errors = '',
    this.statusCode,
  });
}

class ApiResponseHandler {
  static ApiResponse<T> handleSuccess<T>(Response response) {
    return ApiResponse<T>(
      success: true,
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  static ApiResponse<T> handleDioError<T>(DioException e) {
    final responseData = e.response?.data;
    final statusCode = e.response?.statusCode;
    if (statusCode == 401) {
      return ApiResponse<T>(
        success: false,
        errors: 'Session expired. Please log in again.',
        statusCode: statusCode,
      );
    }
    return ApiResponse<T>(
      success: false,
      errors: _extractErrors(responseData),
      statusCode: statusCode,
    );
  }

  static ApiResponse<T> handleGenericError<T>(dynamic e) {
    return ApiResponse<T>(
      success: false,
      errors: e.toString(),
    );
  }

  static String _extractErrors(dynamic data) {
    if (data == null) return 'No error details provided by the server';

    try {
      if (data is String) {
        return data;
      }

      if (data is Map<String, dynamic>) {
        // auth user
        if (data.containsKey('successed') &&
            data['successed'] == false &&
            data.containsKey('errors')) {
          final errors = data['errors'];
          if (errors is List && errors.isNotEmpty) {
            return errors[0].toString();
          } else if (errors is String) {
            return errors;
          }
        }

        // payment wallet
        if (data.containsKey('status') &&
            data['status'] == 'failed' &&
            data.containsKey('message')) {
          return data['message'].toString();
        }

        // fallback message
        if (data.containsKey('message')) {
          return data['message'].toString();
        }

        // إذا لم يتم العثور على حقل محدد
        return 'Unknown server error: ${data.toString()}';
      }

      return 'Unexpected error format: ${data.toString()}';
    } catch (e) {
      return 'Error parsing response: $e';
    }
  }
}
