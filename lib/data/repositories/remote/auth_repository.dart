import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthenticationRepository {
  final String? _apiUrl = dotenv.env['API_URL'];
  final String? _apiKey = dotenv.env['API_KEY'];

  Future<Map<String, dynamic>> registerFun({
    required AuthModel user,
  }) async {
    try {
      Map<String, dynamic> response = await ApiHelper().post(
        url: '$_apiUrl/Register',
        body: user.toJson(),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return response;
    } on DioException catch (e) {
      return {
        'success': false,
        'error': ["Unexpected error: ${e.message}"],
      };
    }
  }

  Future<Map<String, dynamic>> loginFun({
    required AuthModel user,
  }) async {
    try {
      Map<String, dynamic> response = await ApiHelper().post(
        url: '$_apiUrl/Login',
        body: user.toJson(),
        headers: {
          "Content-Type": "application/json",
        },
      );
      return response;
    } on DioException catch (e) {
      return {
        'success': false,
        'error': ["Unexpected error: ${e.message}"],
      };
    }
  }
}
