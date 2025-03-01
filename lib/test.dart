import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Dio dio = Dio();

            dio.interceptors.add(InterceptorsWrapper(
              onRequest:
                  (RequestOptions options, RequestInterceptorHandler handler) {
                print("Request: ${options.method} ${options.path}");
                print("Headers: ${options.headers}");
                print("Body: ${options.data}");
                return handler.next(options);
              },
              onResponse:
                  (Response response, ResponseInterceptorHandler handler) {
                print(
                    "Response: ${response.statusCode} ${response.statusMessage}");
                print("Data: ${response.data}");
                return handler.next(response);
              },
              onError: (DioException e, ErrorInterceptorHandler handler) {
                print("Error: ${e.message}");
                return handler.next(e);
              },
            ));

            try {
              Response response = await dio.post(
                "https://studentpathapitest.runasp.net/api/Accounts/Register",
                data: {
                  "fullName": "MohameSobhy",
                  "email": "nadoxal524@bnsteps.com",
                  "password": "Sokar@123",
                  "confirmedPassword": "Sokar@123",
                  "userType": 0,
                  "age": 22,
                  "gender": 1,
                  "phoneNumber": "+201013379651",
                  "registrationDate": DateTime.now().toIso8601String(),
                  "locations": [
                    {
                      "city": "Cairo",
                      "country": "Egypt",
                      "latitude": 30.0444,
                      "longitude": 31.2357
                    }
                  ]
                },
                options: Options(
                  headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json",
                  },
                ),
              );
              print("Response: \n${response.data}");
            } on DioException catch (e) {
              if (e.response != null) {
                if (e.response?.statusCode == 400) {
                  final responseData = e.response?.data;
                  if (responseData != null && responseData['errors'] != null) {
                    print("Error: ${responseData['errors'].join(", ")}");
                  } else {
                    print("Error: Bad Request");
                  }
                } else {
                  print(
                      "Error: ${e.response?.statusCode} ${e.response?.statusMessage}");
                }
              } else {
                print("Error: ${e.message}");
              }
            }
          },
          child: Text("Test"),
        ),
      ),
    );
  }
}
