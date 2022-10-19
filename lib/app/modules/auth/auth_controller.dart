import 'dart:html' as html;

import 'package:get/get.dart';
import 'package:web_boarding_group/app/model/admin_model.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';

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
    html.window.onBeforeUnload.listen((event) {
      if (!['/', Routes.FORGOT_PASS].contains(html.window.location.pathname)) {
        html.window.localStorage['is_refresh'] = 'done';
      }
    });

    if (html.window.localStorage['is_refresh'] == 'done') {
      admin.value.name = "Nguyễn Thị Vân";
    }
  }
}
