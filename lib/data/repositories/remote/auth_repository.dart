import 'dart:convert';

import 'package:aoun_app/data/model/auth%20models/driver_auth_model/driver_auth_model.dart';
import 'package:aoun_app/data/model/auth%20models/user_auth_model/auth_model.dart';
import 'package:aoun_app/data/model/auth%20models/user_auth_model/location.dart';
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

  Future<ApiResponse<Map<String, dynamic>>> registerUser({
    required UserAuthModel user,
    required LocationModel location,
  }) async {
    try {
      FormData body = FormData.fromMap({
        "fullName": user.fullName,
        "email": user.email,
        "password": user.password,
        "confirmedPassword": user.confirmedPassword,
        "userType": user.userType,
        "age": user.age,
        "gender": user.gender,
        "phoneNumber": user.phoneNumber,
        "registrationDate": user.registrationDate!.toIso8601String(),
        "locationsJson": jsonEncode([
          {
            "city": location.city,
            "country": location.country,
            "latitude": location.latitude,
            "longitude": location.longitude,
          }
        ]),
        "vehicleInfoJson": jsonEncode([
          {
            "VehicleBrand": "null",
            "VehicleModel": "null",
            "VehicleColor": "null",
            "ProductionYear": 2222,
            "PlateNumber": "null",
            "SeatingCapacity": 0
          }
        ]),
      });

      return await ApiHelper().post(
        url: '$_apiUrl/Accounts/Register',
        body: body,
        headers: {
          'Content-Type': 'multipart/form-data',
          "Accept": "application/json",
        },
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> registerDriver({
    required DriverAuthModel user,
  }) async {
    try {
      FormData body = FormData.fromMap({
        "fullName": user.fullName,
        "email": user.email,
        "password": user.password,
        "confirmedPassword": user.confirmedPassword,
        "userType": user.userType,
        "age": user.age,
        "gender": user.gender,
        "phoneNumber": user.phoneNumber,
        "registrationDate": user.registrationDate!.toIso8601String(),
        "ImgUrl": user.imgUrl,
        "DrivingLicense": user.drivingLicense,
        "IdNumber": user.idNumber,
        "LicenseNumber": user.licenseNumber,
        "LicenseExpiryDate": user.licenseExpiryDate,
        "locationsJson": jsonEncode([
          {
            "city": user.locationsJson![0].city,
            "country": user.locationsJson![0].country,
            "latitude": user.locationsJson![0].latitude,
            "longitude": user.locationsJson![0].longitude,
          }
        ]),
        "vehicleInfoJson": jsonEncode([
          {
            "VehicleBrand": user.vehicleInfoJson![0].vehicleBrand,
            "VehicleModel": user.vehicleInfoJson![0].vehicleModel,
            "VehicleColor": user.vehicleInfoJson![0].vehicleColor,
            "ProductionYear": user.vehicleInfoJson![0].productionYear,
            "PlateNumber": user.vehicleInfoJson![0].plateNumber,
            "SeatingCapacity": user.vehicleInfoJson![0].seatingCapacity
          }
        ]),
      });

      if (user.vehiclePicture0 != null) {
        body.files.add(MapEntry(
          "VehiclePicture_0",
          await MultipartFile.fromFile(user.vehiclePicture0!,
              filename: "vehicle_picture.jpg"),
        ));
      }
      if (user.vehicleRegistrationFront0 != null) {
        body.files.add(MapEntry(
          "VehicleRegistrationFront_0",
          await MultipartFile.fromFile(user.vehicleRegistrationFront0!,
              filename: "vehicle_registration_front.jpg"),
        ));
      }
      if (user.vehicleRegistrationBack0 != null) {
        body.files.add(MapEntry(
          "VehicleRegistrationBack_0",
          await MultipartFile.fromFile(user.vehicleRegistrationBack0!,
              filename: "vehicle_registration_back.jpg"),
        ));
      }
      if (user.licenseSelfie != null) {
        body.files.add(MapEntry(
          "LicenseSelfie",
          await MultipartFile.fromFile(user.licenseSelfie!,
              filename: "license_selfie.jpg"),
        ));
      }
      if (user.licenseBack != null) {
        body.files.add(MapEntry(
          "LicenseBack",
          await MultipartFile.fromFile(user.licenseBack!,
              filename: "license_back.jpg"),
        ));
      }
      if (user.licenseFront != null) {
        body.files.add(MapEntry(
          "LicenseFront",
          await MultipartFile.fromFile(user.licenseFront!,
              filename: "license_front.jpg"),
        ));
      }
      if (user.criminalRecord != null) {
        body.files.add(MapEntry(
          "CriminalRecord",
          await MultipartFile.fromFile(user.criminalRecord!,
              filename: "criminal_record.jpg"),
        ));
      }
      if (user.idBack != null) {
        body.files.add(MapEntry(
          "IdBack",
          await MultipartFile.fromFile(user.idBack!, filename: "id_back.jpg"),
        ));
      }
      if (user.idFront != null) {
        body.files.add(MapEntry(
          "IdFront",
          await MultipartFile.fromFile(user.idFront!, filename: "id_front.jpg"),
        ));
      }

      return await ApiHelper().post(
        url: '$_apiUrl/Accounts/Register',
        body: body,
        headers: {
          'Content-Type': 'multipart/form-data',
          "Accept": "application/json",
        },
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> login({
    required UserAuthModel user,
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
    required UserAuthModel user,
  }) async {
    return _handleRequest(
      endpoint: '$_apiUrl/Accounts/send-otp-for-password-reset',
      body: {
        "email": user.email.toString(),
      },
    );
  }

  Future<ApiResponse<Map<String, dynamic>>> verifyOtp({
    required UserAuthModel user,
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
    required UserAuthModel user,
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
