import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/auth/auth_controller.dart';

import 'dart:html' as html;

import 'package:web_boarding_group/app/widget/router_delegate/general_router_delegate.dart';

class HomeController extends GetxController {
  final AuthController authController = Get.find();
  final generalRouterDelegate = GeneralRouterDelegate();

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initData() {
    html.window.localStorage['is_refresh'] = 'done';
  }
}
