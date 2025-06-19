class PaymentModel {
  String? paymentMethod;
  String? transactionId;
  String? status;
  DateTime? paymentDate;

  PaymentModel({
    this.paymentMethod,
    this.transactionId,
    this.status,
    this.paymentDate,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      paymentMethod: json['paymentMethod'] as String?,
      transactionId: json['transactionId'] as String?,
      status: json['status'] as String?,
      paymentDate: json['paymentDate'] == null
          ? null
          : DateTime.parse(json['paymentDate']),
    );
  }

  Map<String, dynamic> toJson() => {
        'paymentMethod': paymentMethod,
        'transactionId': transactionId,
        'status': status,
        'paymentDate': paymentDate?.toIso8601String(),
      };
}
