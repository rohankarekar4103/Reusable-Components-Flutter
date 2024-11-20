import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yash_mobility_componentdevelopment_flutter/utils/screen_routes/route_name.dart';
import 'package:yash_mobility_componentdevelopment_flutter/view/home.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context) => Home());
        // Add your required route name as case and corresponding file here for navigation
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Text('No route defined'),
          );
        }
        );
    }
  }
}
