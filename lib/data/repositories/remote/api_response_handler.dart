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
    dynamic data = response.data;

    if (data is List) {
      data = data.map((e) => e as Map<String, dynamic>).toList();
    }

    final bool isSuccess = _isSuccess(data);
    return ApiResponse<T>(
      success: isSuccess,
      data: data as T,
      errors: _extractErrors(data),
      statusCode: response.statusCode,
    );
  }

  static ApiResponse<T> handleDioError<T>(DioException e) {
    final responseData = e.response?.data;
    final statusCode = e.response?.statusCode;
    // if (statusCode == 401) {
    //   return ApiResponse<T>(
    //     success: false,
    //     errors: 'Session expired. Please log in again.',
    //     statusCode: statusCode,
    //   );
    // }
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

  static bool _isSuccess(dynamic data) {
    if (data is Map<String, dynamic>) {
      if (data.containsKey('success') && data['success'] == true) {
        return true;
      }
      if (data.containsKey('successed') && data['successed'] == true) {
        return true;
      }
      if (data.containsKey('status') && data['status'] == 'OK') {
        return true;
      }
      if (data.containsKey('routes')) {
        return true;
      }
      if (data.containsKey('message')) {
        final msg = data['message'].toString().toLowerCase();

        if (msg.contains('saved') ||
            msg.contains('created') ||
            msg.contains('submitted') ||
            msg.contains('success') ||
            msg.contains('done')) {
          return true;
        }
      }
    } else if (data is List) {
      return true;
    }
    return false;
  }

  static String _extractErrors(dynamic data) {
    if (data == null) return 'No error details provided by the server';

    try {
      if (data is String) {
        return data;
      }

      if (data is Map<String, dynamic>) {
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

        if (data.containsKey('status') &&
            data['status'] == 'failed' &&
            data.containsKey('message')) {
          return data['message'].toString();
        }

        if (data.containsKey('message')) {
          return data['message'].toString();
        }

        return 'Unknown server error: ${data.toString()}';
      }
      if (data is List) {
        if (data.isEmpty) {
          return 'No active trip requests found';
        }
      }
      return 'Unexpected error format: ${data.toString()}';
    } catch (e) {
      return 'Error parsing response: $e';
    }
  }
}
