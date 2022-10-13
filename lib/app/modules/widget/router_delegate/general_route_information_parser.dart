import 'package:flutter/material.dart';

import 'general_router_path.dart';

class GeneralRouteInformationParser
    extends RouteInformationParser<GeneralRouterPath> {
  @override
  Future<GeneralRouterPath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return GeneralRouterPath.home();
    }

    // if (uri.queryParameters.isNotEmpty) {
    //   return GeneralRouterPath.otherPage(
    //       routeInformation.location!.replaceFirst("/", ""));
    // }

    if (uri.pathSegments.length == 1) {
      final pathName = uri.pathSegments.elementAt(0).toString();
      if (pathName == null) return GeneralRouterPath.unKown();
      return GeneralRouterPath.otherPage(pathName);
    }
    return GeneralRouterPath.unKown();
  }

  @override
  RouteInformation? restoreRouteInformation(
      GeneralRouterPath generalRouterPath) {
    if (generalRouterPath.isUnkown) {
      return const RouteInformation(location: '/error');
    }
    if (generalRouterPath.isGeneralPage) {
      return const RouteInformation(location: '/');
    }
    if (generalRouterPath.isOtherPage) {
      return RouteInformation(location: '/${generalRouterPath.pathName}');
    }
    return const RouteInformation(location: null);
  }
}