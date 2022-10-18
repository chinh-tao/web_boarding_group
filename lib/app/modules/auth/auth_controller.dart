import 'dart:html' as html;

import 'package:get/get.dart';
import 'package:web_boarding_group/app/model/admin_model.dart';
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
    if (storage['is_login'] != null) {
      storage.remove('is_login');
      GeneralRouterDelegate();
    }
  }
}
