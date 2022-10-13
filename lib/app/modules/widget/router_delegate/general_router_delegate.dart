import 'package:web_boarding_group/app/modules/login/views/login_view.dart';
import 'package:web_boarding_group/app/modules/not_found_view.dart';

import 'general_page.dart';
import 'general_router_path.dart';
import 'package:flutter/material.dart';

class GeneralRouterDelegate extends RouterDelegate<GeneralRouterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<GeneralRouterPath> {
  static final GeneralRouterDelegate _instance = GeneralRouterDelegate._();
  String? pathName;
  bool isError = false;

  factory GeneralRouterDelegate() {
    return _instance;
  }

  GeneralRouterDelegate._();

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  GeneralRouterPath get currentConfiguration {
    if (isError) return GeneralRouterPath.unKown();

    if (pathName == null) return GeneralRouterPath.home();

    return GeneralRouterPath.otherPage(pathName);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          if (pathName == null)
            const MaterialPage(
              key: ValueKey('Login'),
              child: LoginView(),
            ),
          if (isError)
            const MaterialPage(
                key: ValueKey('Not Found'), child: NotFoundView()),
          if (pathName != null)
            MaterialPage(
                key: ValueKey(pathName),
                child: GeneralPage(pathName: pathName!))
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;

          pathName = null;
          isError = false;
          GeneralRouterDelegate();
          return true;
        });
  }

  @override
  Future<void> setNewRoutePath(GeneralRouterPath generalRoutePath) async {
    pathName = generalRoutePath.pathName;

    if (generalRoutePath.isUnkown) {
      pathName = null;
      isError = true;
      return;
    }

    if (generalRoutePath.isOtherPage) {
      if (generalRoutePath.pathName != null) {
        pathName = generalRoutePath.pathName;
        isError = false;
        return;
      } else {
        isError = true;
        return;
      }
    } else {
      pathName = null;
    }
  }

  void setPathName(String pathName) {
    this.pathName = pathName;
    setNewRoutePath(GeneralRouterPath.otherPage(this.pathName));
    GeneralRouterDelegate();
  }
}
