import 'dart:html' as html;

import 'package:get/get.dart';
import 'package:web_boarding_group/app/model/admin_model.dart';

import '../../common/global.dart';

class AuthController extends GetxController {
  final admin = AdminModel().obs;
  bool isLogin = false;

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
    html.window.onBeforeUnload.listen((event) async {
      if (event.cancelable! == true) {
        return;
      }
      storage.remove('is_login');
    });
  }
}
