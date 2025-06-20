import 'dart:developer';

import 'package:aoun_app/data/repositories/remote/api_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'contant_us_state.dart';

class ContantUsCubit extends Cubit<ContantUsState> {
  ContantUsCubit() : super(ContantUsInitial());

  sendForm({
    required String email,
    required String phone,
    required String address,
    required String message,
  }) async {
    emit(ContantUsLoading());

    try {
      final response = await Dio().post(
        'https://formspree.io/f/xjkwazbl',
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
          followRedirects: false,
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
        data: {
          'email': email,
          'phone': phone,
          'address': address,
          'message': message,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 302) {
        emit(ContantUsSuccess());
      } else {
        emit(ContantUsFailure());
      }
    } on DioException catch (e) {
      return null;
    } catch (e) {
      return null;
    }
  }
}
