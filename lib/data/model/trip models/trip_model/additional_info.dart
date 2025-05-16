class AdditionalInfo {
  String? startingPoint;
  String? notes;
  List<String>? amenities;

  AdditionalInfo({this.startingPoint, this.notes, this.amenities});

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) {
    return AdditionalInfo(
      startingPoint: json['startingPoint'] as String?,
      notes: json['notes'] as String?,
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'startingPoint': startingPoint,
        'notes': notes,
        'amenities': amenities,
      };
}
