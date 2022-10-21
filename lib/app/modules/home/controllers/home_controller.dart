import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/auth/auth_controller.dart';

import 'dart:html' as html;

class HomeController extends GetxController {
  final AuthController authController = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    initData();
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
