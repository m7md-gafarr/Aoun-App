class UserTransactionResponseModel {
  double? amount;
  String? formattedDate;
  String? formattedPaymentMethod;

  UserTransactionResponseModel(
      {this.amount, this.formattedDate, this.formattedPaymentMethod});

  factory UserTransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      UserTransactionResponseModel(
        amount: (json['amount'] as num?)?.toDouble(),
        formattedDate: json['formattedDate'] as String?,
        formattedPaymentMethod: json['formattedPaymentMethod'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'formattedDate': formattedDate,
        'formattedPaymentMethod': formattedPaymentMethod,
      };
}
