class WeeklyStats {
  double? sunday;
  double? monday;
  double? tuesday;
  double? wednesday;
  double? thursday;
  double? friday;
  double? saturday;

  WeeklyStats({
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
  });

  factory WeeklyStats.fromJson(Map<String, dynamic> json) => WeeklyStats(
        sunday: (json['sunday'] as num?)?.toDouble(),
        monday: (json['monday'] as num?)?.toDouble(),
        tuesday: (json['tuesday'] as num?)?.toDouble(),
        wednesday: (json['wednesday'] as num?)?.toDouble(),
        thursday: (json['thursday'] as num?)?.toDouble(),
        friday: (json['friday'] as num?)?.toDouble(),
        saturday: (json['saturday'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'sunday': sunday,
        'monday': monday,
        'tuesday': tuesday,
        'wednesday': wednesday,
        'thursday': thursday,
        'friday': friday,
        'saturday': saturday,
      };
}
