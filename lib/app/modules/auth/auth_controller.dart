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
    print("1: ${html.window.localStorage['is_refresh']}");
    if (html.window.performance.navigation.type ==
        html.PerformanceNavigation.TYPE_RELOAD) {
      print("2: ${html.window.localStorage['is_refresh']}");
      if (html.window.localStorage['is_refresh'] == 'done') {
        print("3: ${js.context['dataAdmin']}");
        getInforAdmin();
        admin.value.name = 'Nguyễn Thị Vân';
        print("4: ${admin.value.email}");
        print("5: ${admin.value.name}");
        print("6: ${admin.value.idBranch}");
      }
    }
  }

  void getInforAdmin() {
    admin.value.email = js.context['dataAdmin']['email'];
    admin.value.name = js.context['dataAdmin']['name'];
    admin.value.idBranch = js.context['dataAdmin']['idBranch'];
  }
}
