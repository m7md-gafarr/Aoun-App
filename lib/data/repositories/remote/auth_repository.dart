import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/model/auth_model/location.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthenticationRepository {
  final String? _apiUrl = dotenv.env['API_URL'];

  final Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  // Future<Map<String, dynamic>> register({
  //   required AuthModel user,
  // }) async {
  //   try {
  //     Map<String, dynamic> response = await ApiHelper().post(
  //       url: '$_apiUrl/Register',
  //       body: {
  //         "fullName": user.fullName.toString(),
  //         "email": user.email.toString(),
  //         "password": user.password.toString(),
  //         "confirmedPassword": user.confirmedPassword.toString(),
  //         "userType": user.userType,
  //         "age": user.age,
  //         "gender": user.gender,
  //         "phoneNumber": user.phoneNumber.toString(),
  //         "registrationDate": user.registrationDate,
  //         "locations": [
  //           {
  //             "city": "Cairo",
  //             "country": "Egypt",
  //             "latitude": 30.0444,
  //             "longitude": 31.2357
  //           }
  //         ]
  //       },
  //       headers: _headers,
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     return {
  //       'successed ': false,
  //       'errors': ["Network error: ${e.message}"],
  //     };
  //   } catch (e) {
  //     return {
  //       'successed': false,
  //       'errors': ["Unexpected error register: $e"],
  //     };
  //   }
  // }

  // Future<Map<String, dynamic>> login({
  //   required AuthModel user,
  // }) async {
  //   try {
  //     Map<String, dynamic> response = await ApiHelper().post(
  //       url: '$_apiUrl/Login',
  //       body: {
  //         "email": user.email.toString(),
  //         "password": user.password.toString(),
  //       },
  //       headers: _headers,
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     if (e.response!.statusCode == 401) {
  //       return e.response!.data as Map<String, dynamic>;
  //     } else {
  //       return {
  //         'successed': false,
  //         'errors': ["Unexpected error: ${e.response?.data}"],
  //       };
  //     }
  //   }
  // }

  // Future<Map<String, dynamic>> sendOTPForPasswordReset({
  //   required AuthModel user,
  // }) async {
  //   try {
  //     Map<String, dynamic> response = await ApiHelper().post(
  //       url: '$_apiUrl/send-otp-for-password-reset',
  //       body: {
  //         "email": user.email.toString(),
  //       },
  //       headers: _headers,
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     if (e.response!.statusCode == 400 || e.response!.statusCode == 401) {
  //       return e.response!.data as Map<String, dynamic>;
  //     } else {
  //       return {
  //         'successed': false,
  //         'errors': ["Network error: ${e.response?.data}"],
  //       };
  //     }
  //   } catch (e) {
  //     return {
  //       'successed': false,
  //       'errors': ["Unexpected error: $e"],
  //     };
  //   }
  // }

  // Future<Map<String, dynamic>> verifyOtp({
  //   required AuthModel user,
  //   required String otp,
  // }) async {
  //   try {
  //     Map<String, dynamic> response = await ApiHelper().post(
  //       url: '$_apiUrl/verify-otp',
  //       body: {
  //         "email": user.email.toString(),
  //         "otp": otp,
  //       },
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Accept": "application/json",
  //       },
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     if (e.response!.statusCode == 400 || e.response!.statusCode == 401) {
  //       return e.response!.data as Map<String, dynamic>;
  //     } else {
  //       return {
  //         'successed': false,
  //         'errors': ["Network error: ${e.response?.data}"],
  //       };
  //     }
  //   } catch (e) {
  //     return {
  //       'successed': false,
  //       'errors': ["Unexpected error: $e"],
  //     };
  //   }
  // }

  // Future<Map<String, dynamic>> confirmPassword({
  //   required AuthModel user,
  // }) async {
  //   try {
  //     Map<String, dynamic> response = await ApiHelper().post(
  //       url: '$_apiUrl/reset-password-with-otp',
  //       body: {
  //         "email": user.email.toString(),
  //         "newPassword": user.password.toString(),
  //         "confirmedNewPassword": user.confirmedPassword.toString()
  //       },
  //       headers: _headers,
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     if (e.response!.statusCode == 400 || e.response!.statusCode == 401) {
  //       return e.response!.data as Map<String, dynamic>;
  //     } else {
  //       return {
  //         'successed': false,
  //         'errors': ["Network error: ${e.response?.data}"],
  //       };
  //     }
  //   } catch (e) {
  //     return {
  //       'successed': false,
  //       'errors': ["Unexpected error: $e"],
  //     };
  //   }
  // }

  Future<Map<String, dynamic>> register({
    required AuthModel user,
    required LocationModel location,
  }) async {
    return _handleRequest(endpoint: '$_apiUrl/Register', body: {
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

  Future<Map<String, dynamic>> login({
    required AuthModel user,
  }) async {
    return _handleRequest(
      endpoint: '$_apiUrl/Login',
      body: {
        "email": user.email.toString(),
        "password": user.password.toString(),
      },
    );
  }

  Future<Map<String, dynamic>> sendOTPForPasswordReset({
    required AuthModel user,
  }) async {
    return _handleRequest(
      endpoint: '$_apiUrl/send-otp-for-password-reset',
      body: {
        "email": user.email.toString(),
      },
    );
  }

  Future<Map<String, dynamic>> verifyOtp({
    required AuthModel user,
    required String otp,
  }) async {
    return _handleRequest(
      endpoint: '$_apiUrl/verify-otp',
      body: {
        "email": user.email.toString(),
        "otp": otp,
      },
    );
  }

  Future<Map<String, dynamic>> confirmPassword({
    required AuthModel user,
  }) async {
    return _handleRequest(
      endpoint: '$_apiUrl/reset-password-with-otp',
      body: {
        "email": user.email,
        "newPassword": user.password,
        "confirmedNewPassword": user.confirmedPassword,
      },
    );
  }

  Future<Map<String, dynamic>> _handleRequest({
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
      return _handleDioException(e);
    } catch (e) {
      return {
        'successed': false,
        'errors': ["Unexpected error: $e"],
      };
    }
  }

  Map<String, dynamic> _handleDioException(DioException e) {
    if (e.response != null) {
      return e.response!.data as Map<String, dynamic>;
    }
    return {
      'successed': false,
      'errors': ["Network error: ${e.message}"],
    };
  }
}
