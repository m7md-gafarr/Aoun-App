class Location {
  String? city;
  String? country;
  int? latitude;
  int? longitude;

  Location({this.city, this.country, this.latitude, this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json['city'] as String?,
        country: json['country'] as String?,
        latitude: json['latitude'] as int?,
        longitude: json['longitude'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'city': city,
        'country': country,
        'latitude': latitude,
        'longitude': longitude,
      };
}
