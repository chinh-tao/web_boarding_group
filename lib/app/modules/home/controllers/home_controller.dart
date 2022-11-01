import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/auth/auth_controller.dart';

import 'dart:html' as html;

import '../../../common/config.dart';
import '../../../routes/router_delegate/general_router_delegate.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AuthController authController = Get.find();
  late TabController tabController;

  final generalRouterDelegate = GeneralRouterDelegate();

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
    tabController = TabController(length: 3, vsync: this);
    html.window.localStorage['is_refresh'] = 'done';
  }
}
