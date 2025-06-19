import 'package:aoun_app/core/utils/extract_user_info_from_token.dart';
import 'package:aoun_app/data/repositories/local/shared_pref.dart';
import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentRepository {
  final String? _apiUrl = dotenv.env['API_URL'];

  final Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  Future<String> getToken() async {
    String? token = await SharedPreferencesService().getToken();
    if (token != null && token.isNotEmpty) {
      return token;
    } else {
      return "";
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> payWithWallet({
    required int bookingId,
    required String walletId,
    required int amount,
    required String email,
  }) async {
    try {
      String? token = await SharedPreferencesService().getToken();
      return await ApiHelper().post(
        url: '$_apiUrl/Paymob/Wallet',
        body: {
          "bookingId": bookingId,
          "walletId": walletId,
          "amount": amount,
          "email": email,
        },
        headers: {
          "Content-Type": "application/json",
          "Accept": " */*",
          "Authorization": "Bearer $token"
        },
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> payWithCard({
    required int amount,
    required int bookingId,
  }) async {
    String token = await getToken();
    String email = extractUserInfoFromToken().extractUserEmailFromToken(token);
    try {
      String? token = await SharedPreferencesService().getToken();
      return await ApiHelper().post(
        url: '$_apiUrl/Payments/create-payment-intent',
        body: {
          'amount': amount,
          'currency': "EGP",
          'email': email,
          'bookingId': bookingId,
        },
        headers: {
          "Content-Type": "application/json",
          "Accept": " */*",
          "Authorization": "Bearer $token"
        },
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError(e);
    }
  }

  Future<void> confirmPayment(String clientSecret) async {
    try {
      await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: clientSecret,
        data: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );
    } catch (e) {
      ApiResponseHandler.handleGenericError(e.toString());
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> _handleRequest({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return await ApiHelper().post(
        url: endpoint,
        body: body,
        headers: _headers,
      );
    } on DioException catch (e) {
      return ApiResponseHandler.handleDioError(e);
    } catch (e) {
      return ApiResponseHandler.handleGenericError(e);
    }
  }

  Future<ApiResponse<Map<String, dynamic>>> transactions() async {
    String? token = await SharedPreferencesService().getToken();

    try {
      return await ApiHelper().get<Map<String, dynamic>>(
        url: "$_apiUrl/Driver/wallet-transactions",
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

  Future<ApiResponse<Map<String, dynamic>>> withdrawFromWallet(
      {required int amount}) async {
    String? token = await SharedPreferencesService().getToken();

    try {
      return await ApiHelper().post<Map<String, dynamic>>(
        url: "$_apiUrl/Driver/withdraw-from-wallet",
        body: {"amount": amount},
        headers: {
          'Content-Type': 'application/json',
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

  // not need
  Future<ApiResponse<Map<String, dynamic>>> registerUser(
    String name,
    String email,
  ) async {
    return _handleRequest(
      body: {
        'name': name,
        'email': email,
      },
      endpoint: '$_apiUrl/Payments/register-user',
    );
  }

  // not need
  Future<String?> createPaymentMethod() async {
    try {
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(),
        ),
      );

      return paymentMethod.id;
    } catch (e) {
      ApiResponseHandler.handleGenericError(e.toString());
    }
    return null;
  }

  // not need
  Future<ApiResponse<Map<String, dynamic>>> sendPaymentMethodToBackend(
    String customerId,
    String paymentMethodId,
  ) async {
    return _handleRequest(
      body: {
        'customerId': customerId,
        'paymentMethodId': paymentMethodId,
      },
      endpoint: '$_apiUrl/Payments/add-card',
    );
  }
}
