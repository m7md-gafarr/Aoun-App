class ToLocation {
  int? id;
  double? latitude;
  double? longitude;
  String? displayName;
  String? fullAddress;

  ToLocation({
    this.id,
    this.latitude,
    this.longitude,
    this.displayName,
    this.fullAddress,
  });

  factory ToLocation.fromJson(Map<String, dynamic> json) => ToLocation(
        id: json['id'] as int?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        displayName: json['displayName'] as String?,
        fullAddress: json['fullAddress'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'latitude': latitude,
        'longitude': longitude,
        'displayName': displayName,
        'fullAddress': fullAddress,
      };
}
