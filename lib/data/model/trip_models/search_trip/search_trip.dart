import 'datum.dart';

class SearchTrip {
  List<Datum>? data;
  bool? success;
  String? message;
  int? statusCode;

  SearchTrip({this.data, this.success, this.message, this.statusCode});

  factory SearchTrip.fromJson(Map<String, dynamic> json) => SearchTrip(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        success: json['success'] as bool?,
        message: json['message'] as String?,
        statusCode: json['statusCode'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'success': success,
        'message': message,
        'statusCode': statusCode,
      };
}
