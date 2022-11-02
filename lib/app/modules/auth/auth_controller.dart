import 'dart:convert';
import 'dart:html' as html;
import 'dart:js' as js;

import 'package:get/get.dart';
import 'package:web_boarding_group/app/common/api.dart';
import 'package:web_boarding_group/app/model/admin_model.dart';

class AuthController extends GetxController {
  final admin = AdminModel().obs;

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
    handleReloadPage();
  }

  void handleReloadPage() async {
    print(html.window.localStorage['is_refresh']);
    if (html.window.performance.navigation.type ==
        html.PerformanceNavigation.TYPE_RELOAD) {
      if (html.window.localStorage['is_refresh'] == 'done') {
        print(js.context['dataAdmin']);
        print(admin.value.email);
        print(admin.value.name);
        print(admin.value.idBranch);
        getInforAdmin();
      }
    }
  }

  void getInforAdmin() {
    admin.value.email = js.context['dataAdmin']['email'];
    admin.value.name = js.context['dataAdmin']['name'];
    admin.value.idBranch = js.context['dataAdmin']['idBranch'];
  }
}
