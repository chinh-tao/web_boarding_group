import 'dart:html' as html;
import 'dart:js' as js;

import 'package:get/get.dart';
import 'package:web_boarding_group/app/model/admin_model.dart';

class AuthController extends GetxController {
  final admin = AdminModel().obs;
  bool checkReload = false;

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
    print(html.window.localStorage['is_refresh']);
    if (html.window.performance.navigation.type ==
        html.PerformanceNavigation.TYPE_RELOAD) {
      if (html.window.localStorage['is_refresh'] == 'done') {
        admin.value.name = "Nguyễn Thị Vân";
        print('This page is reloaded');
      }
    }
  }
}
