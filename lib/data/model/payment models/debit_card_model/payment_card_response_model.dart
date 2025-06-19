class PaymentCardResponseModel {
  String? customerId;
  String? ephemeralKeySecret;
  String? paymentIntentClientSecret;
  String? publishableKey;
  String? paymentIntentId;

  PaymentCardResponseModel({
    this.customerId,
    this.ephemeralKeySecret,
    this.paymentIntentClientSecret,
    this.publishableKey,
    this.paymentIntentId,
  });

  factory PaymentCardResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentCardResponseModel(
      customerId: json['customerId'] as String?,
      ephemeralKeySecret: json['ephemeralKeySecret'] as String?,
      paymentIntentClientSecret: json['paymentIntentClientSecret'] as String?,
      publishableKey: json['publishableKey'] as String?,
      paymentIntentId: json['paymentIntentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'ephemeralKeySecret': ephemeralKeySecret,
        'paymentIntentClientSecret': paymentIntentClientSecret,
        'publishableKey': publishableKey,
        'paymentIntentId': paymentIntentId,
      };
}
