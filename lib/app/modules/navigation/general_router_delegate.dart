import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/login/controllers/login_controller.dart';
import 'package:web_boarding_group/app/modules/login/views/login_view.dart';
import 'package:web_boarding_group/not_connect_view.dart';
import 'package:web_boarding_group/time_out_view.dart';

import 'general_router_path.dart';
import 'package:flutter/material.dart';

class GeneralRouterDelegate extends RouterDelegate<GeneralRouterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<GeneralRouterPath> {
  static final GeneralRouterDelegate _instance = GeneralRouterDelegate._();
  String? pathName;
  bool isError = false;

  // factory GeneralRouterDelegate({bool? isLoggedIn}) {
  //   _instance.isLoggedIn = isLoggedIn;
  //   return _instance;
  // }

  GeneralRouterDelegate._();

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  GeneralRouterPath get currentConfiguration {
    if (isError) return GeneralRouterPath.unKown();

    // if (pathName == null) return GeneralRouterPath.home();

    return GeneralRouterPath.otherPage(pathName);
  }

  void onTapped(String path) {
    pathName = path;
    print(pathName);
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey,
        pages: [
          MaterialPage(
            key: const ValueKey('LoginView'),
            child: const LoginView(),
          ),
          if (isError)
            MaterialPage(
                key: ValueKey('NotConnectView'), child: NotConnectView())
          else if (pathName != null)
            MaterialPage(key: ValueKey(pathName), child: TimeOutView())
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;

          pathName = null;
          isError = false;
          notifyListeners();

          return true;
        });
  }

  @override
  Future<void> setNewRoutePath(GeneralRouterPath generalRoutePath) async {
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
}
