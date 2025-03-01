class LocationModel {
  String? city;
  String? country;
  double? latitude;
  double? longitude;

  LocationModel({this.city, this.country, this.latitude, this.longitude});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        city: json['city'] as String?,
        country: json['country'] as String?,
        latitude: json['latitude'] as double?,
        longitude: json['longitude'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'city': city,
        'country': country,
        'latitude': latitude,
        'longitude': longitude,
      };
}
