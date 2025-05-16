class BasicInfo {
  String? formattedDepartureTime;
  String? formattedDistance;
  String? formattedDuration;
  int? availableSeats;

  BasicInfo({
    this.formattedDepartureTime,
    this.formattedDistance,
    this.formattedDuration,
    this.availableSeats,
  });

  factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
        formattedDepartureTime: json['formattedDepartureTime'] as String?,
        formattedDistance: json['formattedDistance'] as String?,
        formattedDuration: json['formattedDuration'] as String?,
        availableSeats: json['availableSeats'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'formattedDepartureTime': formattedDepartureTime,
        'formattedDistance': formattedDistance,
        'formattedDuration': formattedDuration,
        'availableSeats': availableSeats,
      };
}
