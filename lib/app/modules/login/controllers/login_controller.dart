import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_boarding_group/app/model/admin_model.dart';
import 'package:web_boarding_group/app/modules/auth/auth_controller.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';

import '../../../common/api.dart';
import '../../../common/utils.dart';
import '../../../widget/router_delegate/general_router_delegate.dart';

class LoginController extends GetxController {
  final AuthController authController = Get.find();

  final TextEditingController inputEmail = TextEditingController();
  final TextEditingController inputPass = TextEditingController();

  final generalRouterDelegate = GeneralRouterDelegate();
  final listErr = <String>["", ""].obs;
  final isLoading = false.obs;
  final regex = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9$@!%*?&#^+=-_]{8,16}$");

  @override
  void onInit() {
    inputEmail.text = 'chinhtao1908@gmail.com';
    inputPass.text = 'yGN9?MKM';
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

  bool get validator {
    var result = true;
    listErr.value = ["", ""];
    if (inputEmail.text.trim().isEmpty) {
      listErr[0] = 'tài khoản email không được để trống';
      result = false;
    } else if (!inputEmail.text.trim().isEmail) {
      listErr[0] = 'địa chỉ email không hợp lệ';
      result = false;
    }
    if (generalRouterDelegate.pathName == null &&
        inputPass.text.trim().isEmpty) {
      listErr[1] = 'mật khẩu không được để trống';
      result = false;
    } else if (generalRouterDelegate.pathName == null &&
        !regex.hasMatch(inputPass.text.trim())) {
      listErr[1] =
          'mật khẩu phải có 8-16 ký tự chữ và số bao gồm cả chữ hoa, chữ thường và số';
      result = false;
    }
    update();
    return result;
  }

  void submit(context) async {
    if (generalRouterDelegate.pathName == null) {
      await handleLogin(context);
    } else {
      await handleForgotPass(context);
    }
  }

  Future<void> handleLogin(context) async {
    if (!validator) return;
    final form = {
      "email": inputEmail.text.trim(),
      "pass": inputPass.text.trim()
    };

    isLoading(true);
    final res = await api.post('/login', data: form);
    isLoading(false);

    if (res.statusCode == 200 && res.data['code'] == 0) {
      authController.admin.value = AdminModel.fromJson(res.data['payload']);
      generalRouterDelegate.setPathName(pathName: Routes.HOME);
    } else {
      Utils.messError(context, res.data['message']);
    }
    update();
  }

  Future<void> handleForgotPass(context) async {
    if (!validator) return;
    final form = {'email': inputEmail.text.trim()};

    isLoading(true);
    final res = await api.post('/forgot-pass', data: form);
    isLoading(false);

    if (res.statusCode == 200 && res.data['code'] == 0) {
      Utils.messSuccess(context, res.data['message']);
    } else {
      Utils.messError(context, res.data['message']);
    }
    update();
  }

  void transport() {
    if (generalRouterDelegate.pathName == Routes.FORGOT_PASS) {
      html.window.history.back();
    } else {
      generalRouterDelegate.setPathName(pathName: Routes.FORGOT_PASS);
    }
  }
}
