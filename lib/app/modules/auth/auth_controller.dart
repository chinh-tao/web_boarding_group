import 'dart:html' as html;

import 'package:get/get.dart';
import 'package:web_boarding_group/app/model/admin_model.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';
import 'package:web_boarding_group/app/widget/router_delegate/general_router_delegate.dart';

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
    print('iii: ${admin.value.name}');
    print('lll: ${html.window.localStorage['is_login']}');
    if ((html.window.localStorage['is_login'] != null) &&
        (admin.value.name == null)) {
      admin.value.name = "Nguyễn Thị Vân";
      print('sss');
    } else if ((html.window.localStorage['is_login'] != null) &&
        (admin.value.name != null)) {
      html.window.onBeforeUnload.listen((event) async {
        html.window.localStorage.remove('is_login');
      });
      print('ccc');
    }
  }
}
