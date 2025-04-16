import 'prediction.dart';

class PlaceAutocompeletModel {
  List<Prediction>? predictions;
  String? status;

  PlaceAutocompeletModel({this.predictions, this.status});

  factory PlaceAutocompeletModel.fromJson(Map<String, dynamic> json) {
    return PlaceAutocompeletModel(
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'predictions': predictions?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
