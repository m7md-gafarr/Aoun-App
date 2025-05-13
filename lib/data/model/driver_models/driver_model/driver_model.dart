import 'data.dart';

class DriverModel {
  Data? data;
  bool? success;
  String? message;
  int? statusCode;

  DriverModel({this.data, this.success, this.message, this.statusCode});

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        success: json['success'] as bool?,
        message: json['message'] as String?,
        statusCode: json['statusCode'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'success': success,
        'message': message,
        'statusCode': statusCode,
      };
}
