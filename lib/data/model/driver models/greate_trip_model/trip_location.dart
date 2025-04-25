class LocationTrip {
  double? latitude;
  double? longitude;
  String? displayName;
  String? fullAddress;
  String? additionalNotes;

  LocationTrip({
    this.latitude,
    this.longitude,
    this.displayName,
    this.fullAddress,
    this.additionalNotes,
  });

  factory LocationTrip.fromJson(Map<String, dynamic> json) => LocationTrip(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        displayName: json['displayName'] as String?,
        fullAddress: json['fullAddress'] as String?,
        additionalNotes: json['additionalNotes'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'displayName': displayName,
        'fullAddress': fullAddress,
        'additionalNotes': additionalNotes,
      };
}
