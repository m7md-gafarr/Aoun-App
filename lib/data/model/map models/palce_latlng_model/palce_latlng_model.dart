import 'location.dart';
import 'viewport.dart';

class PalceLatlngModel {
  Location? location;
  Viewport? viewport;

  PalceLatlngModel({this.location, this.viewport});

  factory PalceLatlngModel.fromJson(Map<String, dynamic> json) {
    return PalceLatlngModel(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      viewport: json['viewport'] == null
          ? null
          : Viewport.fromJson(json['viewport'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'viewport': viewport?.toJson(),
      };
}
