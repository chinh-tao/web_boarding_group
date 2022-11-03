import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_boarding_group/app/common/api.dart';
import 'package:web_boarding_group/app/model/user_model.dart';
import 'package:web_boarding_group/app/modules/auth/auth_controller.dart';

import '../../../common/utils.dart';
import '../../../routes/router_delegate/general_router_delegate.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AuthController authController = Get.find();
  late TabController tabController;

  final TextEditingController inputUserId = TextEditingController();
  final TextEditingController inputUserName = TextEditingController();
  final TextEditingController inputUserRoom = TextEditingController();
  final TextEditingController inputIdBranch = TextEditingController();

  final isLoading = <bool>[false].obs;

  final listErr = <String>["", "", "", ""].obs;
  final listUser = <UserModel>[].obs;
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

  void initData() async {
    tabController = TabController(length: 3, vsync: this);
    html.window.localStorage['is_refresh'] = 'done';
    inputIdBranch.text = authController.admin.value.idBranch!;
    await handleAddUser(null);
  }

  Future<void> handleAddUser(context) async {
    final form = {
      "id_user": inputUserId.text.trim(),
      "name_user": inputUserName.text.trim(),
      "user_room": inputUserRoom.text.trim().isEmpty
          ? inputUserRoom.text.trim()
          : int.parse(inputUserRoom.text.trim()),
      "id_branch": inputIdBranch.text.trim()
    };

    isLoading[0] = true;
    final res = await api.post('/add-user', data: form);
    isLoading[0] = false;

    if (res.statusCode == 200 && res.data['code'] == 0) {
      if (context != null) Utils.messSuccess(context, res.data['message']);
      final listJS = res.data['payload'] as List;
      listUser.value = listJS.map((e) => UserModel.fromJson(e)).toList();
    } else {
      if (res.data['code'] == 400) listUser.clear();
      if (context != null) Utils.messError(context, res.data['message']);
    }
    update();
  }
}
