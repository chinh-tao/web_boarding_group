import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  final TextEditingController inputPhone = TextEditingController();

  final isLoading = <bool>[false].obs;

  final regexID = RegExp(r'^[0-9]{12}$');
  final regexPhone = RegExp(r'^[0-9]*$');
  final listErr = <String>[].obs;
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
    listErr.value = List.filled(2, '');
    html.window.localStorage['is_refresh'] = 'done';
    await handleAddUser(null);
  }

  bool get validatorAddUser {
    var result = true;
    listErr.value = List.filled(2, '');
    if (inputUserId.text.trim().isNotEmpty &&
        !regexID.hasMatch(inputUserId.text.trim())) {
      listErr[0] = 'ID người dùng phải là ký tự số và có ít nhất 12 ký tự';
      result = false;
    }
    if (inputPhone.text.trim().isNotEmpty &&
        !regexPhone.hasMatch(inputPhone.text.trim())) {
      listErr[1] = 'số điện thoại phải là ký tự số';
      result = false;
    }
    update();
    return result;
  }

  Future<void> handleAddUser(context) async {
    if (context != null && !validatorAddUser) return;
    final form = {
      "id_user": inputUserId.text.trim(),
      "name_user": inputUserName.text.trim(),
      "user_room": inputUserRoom.text.trim(),
      "phone_user": inputPhone.text.trim(),
      "id_branch": authController.admin.value.idBranch!
    };

    if (context != null) isLoading[0] = true;
    final res = await api.post('/add-user', data: form);
    if (context != null) isLoading[0] = false;

    if (res.statusCode == 200 && res.data['code'] == 0) {
      if (context != null) Utils.messSuccess(context, res.data['message']);
      final listJS = res.data['payload'] as List;
      listUser.value = listJS.map((e) => UserModel.fromJson(e)).toList();
    } else {
      if (res.data['code'] == 400) listUser.clear();
      Utils.messError(context, res.data['message']);
    }
    update();
  }

  void handleClear() {
    listErr.value = List.filled(2, '');
    inputUserId.clear();
    inputUserName.clear();
    inputUserRoom.clear();
    inputPhone.clear();
    handleAddUser(null);
  }
}
