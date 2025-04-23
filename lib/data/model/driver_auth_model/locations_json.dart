class LocationsJson {
  String? city;
  String? country;
  double? latitude;
  double? longitude;

  LocationsJson({this.city, this.country, this.latitude, this.longitude});

  factory LocationsJson.fromJson(Map<String, dynamic> json) => LocationsJson(
        city: json['city'] as String?,
        country: json['country'] as String?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'city': city,
        'country': country,
        'latitude': latitude,
        'longitude': longitude,
      };
}
