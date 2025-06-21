class DTransaction {
  double? amount;
  String? operation;
  String? formattedDate;

  DTransaction({this.amount, this.operation, this.formattedDate});

  factory DTransaction.fromJson(Map<String, dynamic> json) => DTransaction(
        amount: (json['amount'] as num?)?.toDouble(),
        operation: json['operation'] as String?,
        formattedDate: json['formattedDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'operation': operation,
        'formattedDate': formattedDate,
      };
}
