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
    html.window
        .addEventListener('close', (event) => storage.remove('is_login'));
    // if (!isLoad) {
    //   html.window.onBeforeUnload.listen((event) async {
    //     print('1: ${event.bubbles}');
    //     print('2: ${event.cancelable}');
    //     print('3: ${event.composed}');
    //     print('4: ${event.defaultPrevented}');
    //     print('5: ${event.isTrusted}');
    //     print('6: ${event.type}');
    //     print('7: ${event.isBlank}');
    //     //storage.remove('is_login');
    //   });
    // }
  }
}
