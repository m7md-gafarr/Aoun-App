import 'package:aoun_app/core/utils/extract_user_info_from_token.dart';
import 'package:aoun_app/data/model/user%20models/user_model/user_model.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRepository {
  final String? _apiUrl = dotenv.env['API_URL'];

  Future<UserModel> getUserInformation() async {
    String? token = await SharedPreferencesService().getToken();
    String userID = extractUserInfoFromToken().extractUserIdFromToken(token!);

    ApiResponse<Map<String, dynamic>> response = await ApiHelper()
        .get<Map<String, dynamic>>(url: "$_apiUrl/User/ById/$userID");
    if (response.success) {
      return UserModel.fromJson(response.data!);
    } else {
      throw Exception("Failed to load places: ${response.errors}");
    }
  }
}
