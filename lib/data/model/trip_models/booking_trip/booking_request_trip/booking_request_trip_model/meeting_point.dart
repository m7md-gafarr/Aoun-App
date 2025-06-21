class MeetingPoint {
  double? latitude;
  double? longitude;

  MeetingPoint({this.latitude, this.longitude});

  factory MeetingPoint.fromJson(Map<String, dynamic> json) => MeetingPoint(
        latitude: json['latitude'] as double?,
        longitude: json['longitude'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
