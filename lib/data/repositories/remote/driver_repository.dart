import 'package:aoun_app/core/utils/extract_user_info_from_token.dart';
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
}
