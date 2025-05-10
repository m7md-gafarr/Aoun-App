import 'route.dart';

class GetTripRoute {
  List<Route>? routes;

  GetTripRoute({this.routes});

  factory GetTripRoute.fromJson(Map<String, dynamic> json) => GetTripRoute(
        routes: (json['routes'] as List<dynamic>?)
            ?.map((e) => Route.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'routes': routes?.map((e) => e.toJson()).toList(),
      };
}
