import 'dart:html' as html;

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
    html.window.onBeforeUnload.listen((event) {
      if (checkReload) {
        html.window.localStorage['is_refresh'] = 'done';
      }
    });

    if (html.window.localStorage['is_refresh'] == 'done') {
      admin.value.name = "Nguyễn Thị Vân";
      html.window.localStorage.remove('is_refresh');
    }
  }
}
