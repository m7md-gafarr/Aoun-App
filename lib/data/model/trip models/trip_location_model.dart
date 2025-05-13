class TripLocationModel {
  double? latitude;
  double? longitude;
  String? displayName;
  String? fullAddress;

  TripLocationModel({
    this.latitude,
    this.longitude,
    this.displayName,
    this.fullAddress,
  });

  factory TripLocationModel.fromJson(Map<String, dynamic> json) =>
      TripLocationModel(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        displayName: json['displayName'] as String?,
        fullAddress: json['fullAddress'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'displayName': displayName,
        'fullAddress': fullAddress,
      };
}
