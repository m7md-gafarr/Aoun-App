import 'package:aoun_app/data/model/auth_model/auth_model.dart';
import 'package:aoun_app/data/repositories/remote/Api.dart';
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
      // if (response.containsKey('success') && response['success'] == false) {
      //   return {
      //     'success': false,
      //     'message': response['error'],
      //   };
      // }

      // return {
      //   'success': true,
      //   'message': "Registration completed successfully.",
      //   'data': response,
      // };
    } catch (e) {
      return {
        'success': false,
        'message': "Unexpected error: $e",
      };
    }
  }
}
