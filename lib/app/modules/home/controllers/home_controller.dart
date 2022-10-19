import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/auth/auth_controller.dart';

import 'dart:html' as html;

class HomeController extends GetxController {
  final AuthController authController = Get.find();

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

  void initData() {}
}
