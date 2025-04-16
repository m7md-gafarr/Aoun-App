import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/model/auth_model/location.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthenticationRepository {
  final String? _apiUrl = dotenv.env['API_URL'];

  final Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  Future<ApiResponse<Map<String, dynamic>>> register({
    required AuthModel user,
    required LocationModel location,
  }) async {
    return _handleRequest(endpoint: '$_apiUrl/Accounts/Register', body: {
      "fullName": user.fullName.toString(),
      "email": user.email.toString(),
      "password": user.password.toString(),
      "confirmedPassword": user.confirmedPassword.toString(),
      "userType": user.userType,
      "age": user.age,
      "gender": user.gender,
      "phoneNumber": user.phoneNumber.toString(),
      "registrationDate": user.registrationDate!.toIso8601String(),
      "locations": [
        {
          "city": location.city,
          "country": location.country,
          "latitude": location.latitude,
          "longitude": location.longitude
        }
      ]
    });
  }

  Future<ApiResponse<Map<String, dynamic>>> login({
    required AuthModel user,
  }) async {
    return _handleRequest(
      endpoint: '$_apiUrl/Accounts/Login',
      body: {
        "email": user.email.toString(),
        "password": user.password.toString(),
      },
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> sendOTPForPasswordReset({
    required AuthModel user,
  }) async {
    return _handleRequest(
      endpoint: '$_apiUrl/Accounts/send-otp-for-password-reset',
      body: {
        "email": user.email.toString(),
      },
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> verifyOtp({
    required AuthModel user,
    required String otp,
  }) async {
    return _handleRequest(
      endpoint: '$_apiUrl/Accounts/verify-otp',
      body: {
        "email": user.email.toString(),
        "otp": otp,
      },
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> confirmPassword({
    required AuthModel user,
  }) async {
    return _handleRequest(
      endpoint: '$_apiUrl/Accounts/reset-password-with-otp',
      body: {
        "email": user.email,
        "newPassword": user.password,
        "confirmedNewPassword": user.confirmedPassword,
      },
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> _handleRequest({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    try {
      return await ApiHelper().post(
        url: endpoint,
        body: body,
        headers: _headers,
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }
}
