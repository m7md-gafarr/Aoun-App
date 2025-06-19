import 'dart:developer';

import 'package:aoun_app/core/utils/check_connection/check_connection_cubit.dart';
import 'package:aoun_app/data/model/payment%20models/debit_card_model/payment_card_response_model.dart';
import 'package:aoun_app/data/repositories/remote/api_response_handler.dart';
import 'package:aoun_app/data/repositories/remote/payment_repository.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:meta/meta.dart';

part 'payment_card_state.dart';

class PaymentCardCubit extends Cubit<PaymentCardState> {
  PaymentCardCubit(this.connectionCubit) : super(PaymentCardInitial());
  final CheckConnectionCubit connectionCubit;

  Future<PaymentCardResponseModel?> _paymentCard(
    BuildContext context, {
    required int amount,
    required int bookingId,
  }) async {
    emit(PaymentCardLoading());
    log("💳 Starting payment request...");

    if (connectionCubit.state is CheckConnectionNoInternet) {
      log("🚫 No internet connection.");
      emit(PaymentCardFailure(S.of(context).no_internet_connection));
      return null;
    }

    try {
      log("📤 Sending payment request for bookingId: $bookingId | amount: $amount");
      ApiResponse<Map<String, dynamic>> response =
          await PaymentRepository().payWithCard(
        bookingId: bookingId,
        amount: amount,
      );

      if (response.success) {
        log("✅ Payment response received successfully");
        return PaymentCardResponseModel.fromJson(response.data!);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log("🌐 DioException during payment: ${e.message}", error: e);
      return null;
    } catch (e, st) {
      log("❗ Unexpected error in _paymentCard", error: e, stackTrace: st);
      return null;
    }
  }

  Future<bool> _initPaymentSheet(
    BuildContext context, {
    required int amount,
    required int bookingId,
  }) async {
    try {
      log("🧾 Initializing payment sheet...");
      PaymentCardResponseModel? paymentCardResponseModel =
          await _paymentCard(context, amount: amount, bookingId: bookingId);

      if (paymentCardResponseModel == null) {
        log("⚠️ Payment card response is null, closing dialog.");
        Navigator.pop(context);
        return false;
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Aoun',
          paymentIntentClientSecret:
              paymentCardResponseModel.paymentIntentClientSecret ?? '',
          customerEphemeralKeySecret:
              paymentCardResponseModel.ephemeralKeySecret ?? '',
          customerId: paymentCardResponseModel.customerId ?? '',
        ),
      );
      log("✅ Payment sheet initialized successfully");
      return true;
    } catch (e, st) {
      log("❗ Error initializing payment sheet", error: e, stackTrace: st);
      return false;
    }
  }

  Future<void> _displayPaymentSheet() async {
    try {
      log("💳 Displaying payment sheet...");
      await Stripe.instance.presentPaymentSheet();
      log("✅ Payment sheet completed");
      emit(PaymentCardSuccess());
    } on StripeException catch (e) {
      log("❌ StripeException: ${e.error.localizedMessage}", error: e);
      emit(PaymentCardFailure("${e.error.localizedMessage}"));
    } catch (e, st) {
      log("❗ Unexpected error displaying payment sheet",
          error: e, stackTrace: st);
      return;
    }
  }

  Future<void> makePayment(
    BuildContext context, {
    required int amount,
    required int bookingId,
  }) async {
    log("🚀 Starting makePayment...");
    bool isSheetInitialized = await _initPaymentSheet(
      context,
      amount: amount,
      bookingId: bookingId,
    );

    if (!isSheetInitialized) {
      emit(PaymentCardFailure(
          "Payment initialization failed. Please try again later."));
      return;
    }

    await _displayPaymentSheet();
  }
}
