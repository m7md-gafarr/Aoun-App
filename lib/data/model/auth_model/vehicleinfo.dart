class Vehicleinfo {
  String? vehicleType;
  String? licensePlate;
  int? seatingCapacity;

  Vehicleinfo({this.vehicleType, this.licensePlate, this.seatingCapacity});

  factory Vehicleinfo.fromJson(Map<String, dynamic> json) => Vehicleinfo(
        vehicleType: json['vehicleType'] as String?,
        licensePlate: json['licensePlate'] as String?,
        seatingCapacity: json['seatingCapacity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'vehicleType': vehicleType,
        'licensePlate': licensePlate,
        'seatingCapacity': seatingCapacity,
      };
}
