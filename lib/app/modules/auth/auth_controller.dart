import 'dart:html' as html;

import 'package:get/get.dart';
import 'package:web_boarding_group/app/model/admin_model.dart';

import '../../common/global.dart';

class AuthController extends GetxController {
  final admin = AdminModel().obs;
  bool isLogin = false;
  bool isLoad = false;

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
    if (!isLoad) {
      html.window.onBeforeUnload.listen((event) async {
        // print('1: ${event.bubbles}');
        // if (event.bubbles == null || event.bubbles!) {
        //   storage.remove('is_login');
        // }
        // // print('2: ${event.cancelable}');
        // if (event.cancelable == null || !event.cancelable!) {
        //   storage.remove('is_login');
        // }
        // // print('3: ${event.composed}');
        // if (event.composed == null || event.composed!) {
        //   storage.remove('is_login');
        // }
        // // print('4: ${event.defaultPrevented}');
        // if (event.defaultPrevented) {
        //   storage.remove('is_login');
        // }
        // // print('5: ${event.isTrusted}');
        // if (event.isTrusted == null || !event.isTrusted!) {
        //   storage.remove('is_login');
        // }
        // // print('6: ${event.type}');
        // // print('7: ${event.isBlank}');
        // if (event.isBlank == null || event.isBlank!) {
        //   storage.remove('is_login');
        // }
        storage.remove('is_login');
      });
    }
  }
}
