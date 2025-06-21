import 'datum.dart';

class Transactionsmodel {
  List<DTransaction>? data;
  double? currentBalance;
  String? message;
  bool? success;
  int? statusCode;

  Transactionsmodel({
    this.data,
    this.currentBalance,
    this.message,
    this.success,
    this.statusCode,
  });

  factory Transactionsmodel.fromJson(Map<String, dynamic> json) {
    return Transactionsmodel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentBalance: (json['currentBalance'] as num?)?.toDouble(),
      message: json['message'] as String?,
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'currentBalance': currentBalance,
        'message': message,
        'success': success,
        'statusCode': statusCode,
      };
}
