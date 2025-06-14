import 'weekly_stats.dart';

class DriverDashboardModel {
  int? balance;
  double? earningsSummary;
  int? completedTripsCount;
  WeeklyStats? weeklyStats;

  DriverDashboardModel({
    this.balance,
    this.earningsSummary,
    this.completedTripsCount,
    this.weeklyStats,
  });

  factory DriverDashboardModel.fromJson(Map<String, dynamic> json) {
    return DriverDashboardModel(
      balance: json['balance'] as int?,
      earningsSummary: (json['earningsSummary'] as num?)?.toDouble(),
      completedTripsCount: json['completedTripsCount'] as int?,
      weeklyStats: json['weeklyStats'] == null
          ? null
          : WeeklyStats.fromJson(json['weeklyStats'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'balance': balance,
        'earningsSummary': earningsSummary,
        'completedTripsCount': completedTripsCount,
        'weeklyStats': weeklyStats?.toJson(),
      };
}
