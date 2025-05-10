class FromLocation {
  int? id;
  double? latitude;
  double? longitude;
  String? displayName;
  String? fullAddress;
  String? additionalNotes;

  FromLocation({
    this.id,
    this.latitude,
    this.longitude,
    this.displayName,
    this.fullAddress,
    this.additionalNotes,
  });

  factory FromLocation.fromJson(Map<String, dynamic> json) => FromLocation(
        id: json['id'] as int?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        displayName: json['displayName'] as String?,
        fullAddress: json['fullAddress'] as String?,
        additionalNotes: json['additionalNotes'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'latitude': latitude,
        'longitude': longitude,
        'displayName': displayName,
        'fullAddress': fullAddress,
        'additionalNotes': additionalNotes,
      };
}
