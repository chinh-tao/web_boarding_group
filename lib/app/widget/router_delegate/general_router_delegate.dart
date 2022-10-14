import 'package:get/instance_manager.dart';
import 'package:web_boarding_group/app/modules/auth/auth_controller.dart';
import 'package:web_boarding_group/app/modules/login/views/login_view.dart';
import 'package:web_boarding_group/app/modules/not_found_view.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';

import '../../common/utils.dart';
import 'general_page.dart';
import 'general_router_path.dart';
import 'package:flutter/material.dart';

class GeneralRouterDelegate extends RouterDelegate<GeneralRouterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<GeneralRouterPath> {
  static final GeneralRouterDelegate _instance = GeneralRouterDelegate._();
  final AuthController authController = Get.find();
  bool isLogin = false;
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
          if (pathName == null) ...[
            const MaterialPage(
              key: ValueKey('Login'),
              child: LoginView(),
            )
          ] else if (isError) ...[
            const MaterialPage(
                key: ValueKey('Not Found'), child: NotFoundView())
          ] else
            MaterialPage(
                key: ValueKey(pathName),
                child: GeneralPage(pathName: pathName!))
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;

          pathName = null;
          isError = false;
          _setState();
          return true;
        });
  }

  @override
  Future<bool> popRoute() {
    setPathName(Routes.NOT_FOUND);
    return super.popRoute();
  }

  @override
  Future<void> setNewRoutePath(GeneralRouterPath generalRoutePath,
      {bool isLogin = false}) async {
    pathName = generalRoutePath.pathName;
    // print(generalRoutePath.pathName);
    // print(Utils.routerName.contains(pathName.toString()));

    if (!Utils.routerName.contains(pathName.toString()) ||
        generalRoutePath.isUnkown) {
      //print('1');
      pathName = 'not-found';
      isError = true;
    } else if (generalRoutePath.isOtherPage) {
      if (![null, 'not-found'].contains(pathName)) {
        //print('2');
        if (pathName == 'home' && (authController.admin.value.name == null)) {
          pathName = null;
          isError = false;
        } else {
          pathName = generalRoutePath.pathName;
          isError = false;
        }
      } else if (!isError && pathName == 'not-found') {
        //print('anc');
        isError = false;
        pathName = null;
      }
    } else {
      if (authController.admin.value.name != null) {
        pathName = 'home';
        isError = false;
      } else {
        //print('4');
        pathName = null;
        isError = false;
      }
    }
  }

  void setPathName(String pathName) {
    this.pathName = pathName.replaceFirst('/', '');
    setNewRoutePath(GeneralRouterPath.otherPage(this.pathName));
    _setState();
  }

  void _setState() {
    notifyListeners();
    GeneralRouterDelegate();
  }
}
