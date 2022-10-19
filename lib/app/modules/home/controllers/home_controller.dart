import 'package:flutterwebapp_reload_detector/flutterwebapp_reload_detector.dart';
import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/auth/auth_controller.dart';

import 'dart:html' as html;
import '../../../routes/app_pages.dart';
import '../../../widget/router_delegate/general_router_delegate.dart';

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
