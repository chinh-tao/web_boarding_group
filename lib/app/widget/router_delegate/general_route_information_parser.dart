import 'package:flutter/material.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';

import '../../common/utils.dart';
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

    if (Utils.routerName.contains(uri.toString())) {
      return GeneralRouterPath.otherPage(uri.toString());
    }
    return GeneralRouterPath.unKown();
  }

  @override
  RouteInformation? restoreRouteInformation(
      GeneralRouterPath generalRouterPath) {
    if (generalRouterPath.isUnkown) {
      return const RouteInformation(location: Routes.NOT_FOUND);
    }
    if (generalRouterPath.isGeneralPage) {
      return const RouteInformation(location: '/');
    }
    if (generalRouterPath.isOtherPage) {
      return RouteInformation(location: '${generalRouterPath.pathName}');
    }
    return const RouteInformation(location: null);
  }
}
