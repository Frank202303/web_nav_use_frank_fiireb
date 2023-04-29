/// Passed in as a parameter of MaterialApp.router
import 'package:flutter/material.dart';


import '../values/string_manager.dart';
import 'app_routes.dart';

class HARouteInformationParser extends RouteInformationParser<HARoutePath> {
  @override
  Future<HARoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    // // Handle unknown routes
    return HARoutePath.splash();
  }

  @override
  RouteInformation restoreRouteInformation(HARoutePath path) {
    switch (path.name) {
      case HAStrings.launchScreen:
        return const RouteInformation(location: '/');
    }
    return const RouteInformation(location: '/');
  }
}
