import 'dart:developer';

import 'package:aoun_app/core/utils/dialog/dialog_helper.dart';
import 'package:aoun_app/data/model/trip%20models/booking_trip/booking_response_trip_model.dart';
import 'package:aoun_app/generated/l10n.dart';
import 'package:aoun_app/presentation/user/transport/view/payment_success.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymobWebView extends StatefulWidget {
  final String iFrameUrl;
  BookingResponseTripModel bookingResponseTripModel;
  PaymobWebView(
      {super.key,
      required this.iFrameUrl,
      required this.bookingResponseTripModel});

  @override
  _PaymentWebViewState createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymobWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: S.of(context).paymob_payment_title,
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                log('Loading progress: $progress%');
              },
              onPageStarted: (String url) {
                log('Page started: $url');
              },
              onPageFinished: (String url) {
                log('Page finished: $url');
              },
              onHttpError: (HttpResponseError error) {
                log('HTTP error: $error');
              },
              onWebResourceError: (WebResourceError error) {
                log('Web resource error: ${error.description}');
              },
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.contains('success')) {
                  log('Payment Response URL: ${request.url}');

                  bool isSuccess = request.url.contains('success=true');
                  // String? transactionId =
                  //     Uri.parse(request.url).queryParameters['id'] ?? '';
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text(
                  //       isSuccess
                  //           ? 'Payment Successful! Transaction ID: $transactionId'
                  //           : 'Payment Failed',
                  //     ),
                  //   ),
                  // );

                  //  Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => OrderCompleted(),
                  //           ),
                  //         )

                  isSuccess
                      ? (Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentSuccessScreen(
                              model: widget.bookingResponseTripModel,
                            ),
                          ),
                        ))
                      : (
                          DialogHelper(context).showErroeDialog(
                            message: S.of(context).paymob_error_message,
                          ),
                        );
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(widget.iFrameUrl)),
      ),
    );
  }
}
