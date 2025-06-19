import 'package:aoun_app/core/utils/extract_user_info_from_token.dart';
import 'package:aoun_app/data/model/driver_models/driver_model/driver_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class DriverRepository {
  final String? _apiUrl = dotenv.env['API_URL'];

  Future<ApiResponse<Map<String, dynamic>>> getDriverInformation() async {
    String? token = await SharedPreferencesService().getToken();
    String userID = extractUserInfoFromToken().extractUserIdFromToken(token!);

    try {
      return await ApiHelper()
          .get<Map<String, dynamic>>(url: "$_apiUrl/Driver/ById/$userID");
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> getDriverActiveTrip() async {
    String? token = await SharedPreferencesService().getToken();
    String userID = extractUserInfoFromToken().extractUserIdFromToken(token!);

    try {
      return await ApiHelper()
          .get<Map<String, dynamic>>(url: "$_apiUrl/Driver/$userID/trip");
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> updateDriverProfileData(
      {required DriverModel driverModel}) async {
    String? token = await SharedPreferencesService().getToken();
    String userID = extractUserInfoFromToken().extractUserIdFromToken(token!);
    try {
      FormData body = FormData.fromMap(
        {
          "UserName": driverModel.data!.userName,
          "PhoneNumber": driverModel.data!.phoneNumber,
        },
      );

      if (driverModel.data!.imgUrl != null) {
        body.files.add(
          MapEntry(
            "PersonalPhoto",
            await MultipartFile.fromFile(
              driverModel.data!.imgUrl!,
              filename: "personal_picture.jpg",
            ),
          ),
        );
      }

      return await ApiHelper().put<Map<String, dynamic>>(
        url: "$_apiUrl/Driver/EditDriver/$userID",
        body: body,
        headers: {
          "Accept": "text/plain",
          "Content-Type": "multipart/form-data",
        },
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> getDriverDashboard() async {
    String? token = await SharedPreferencesService().getToken();

    try {
      return await ApiHelper().get<Map<String, dynamic>>(
        url: "$_apiUrl/Driver/dashboard",
        headers: {
          "Authorization": "Bearer $token",
        },
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }
}
