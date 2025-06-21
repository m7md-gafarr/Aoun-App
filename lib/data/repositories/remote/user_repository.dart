import 'package:aoun_app/core/utils/extract_user_info_from_token.dart';
import 'package:aoun_app/data/model/user_models/user_model/user_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRepository {
  final String? _apiUrl = dotenv.env['API_URL'];

  Future<ApiResponse<Map<String, dynamic>>> getUserInformation() async {
    String? token = await SharedPreferencesService().getToken();
    String userID = extractUserInfoFromToken().extractUserIdFromToken(token!);

    try {
      return await ApiHelper()
          .get<Map<String, dynamic>>(url: "$_apiUrl/User/ById/$userID");
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> gettransactions() async {
    String? token = await SharedPreferencesService().getToken();

    try {
      return await ApiHelper().get<Map<String, dynamic>>(
        url: "$_apiUrl/User/UserTransactions",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> getBookingTrip() async {
    String? token = await SharedPreferencesService().getToken();

    try {
      return await ApiHelper().get<Map<String, dynamic>>(
        url: "$_apiUrl/User/UserBookings",
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError<Map<String, dynamic>>(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError<Map<String, dynamic>>(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> updateUserProfileData({
    required UserModel usermodel,
  }) async {
    String? token = await SharedPreferencesService().getToken();

    if (token == null || token.isEmpty || !token.contains('.')) {
      throw Exception("Invalid or missing token");
    }

    String userID = extractUserInfoFromToken().extractUserIdFromToken(token);
    try {
      FormData body = FormData.fromMap(
        {
          "Id": userID,
          "UserName": usermodel.userName,
          "PhoneNumber": usermodel.phoneNumber,
          "ImgUrl": "",
        },
      );

      if (usermodel.imgUrl != null) {
        body.files.add(
          MapEntry(
            "ProfileImage",
            await MultipartFile.fromFile(
              usermodel.imgUrl!,
              filename: "Profile_Image.jpg",
            ),
          ),
        );
      }
      return await ApiHelper().put<Map<String, dynamic>>(
        url: "$_apiUrl/User/EditUser/$userID",
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
}
