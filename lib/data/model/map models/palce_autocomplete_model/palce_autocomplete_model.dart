import 'prediction.dart';

class PalceAutocompleteModel {
  List<Prediction>? predictions;
  String? status;

  PalceAutocompleteModel({this.predictions, this.status});

  factory PalceAutocompleteModel.fromJson(Map<String, dynamic> json) {
    return PalceAutocompleteModel(
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
