import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/common/api.dart';
import 'package:web_boarding_group/app/modules/common/utils.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController inputEmail = TextEditingController();
  final TextEditingController inputPass = TextEditingController();

  final listErr = <String>["", ""].obs;
  final isLoading = false.obs;
  final regex = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9$@!%*?&#^+=-_]{8,16}$");

  @override
  void onInit() {
    inputEmail.text = 'chinhtao1908@gmail.com';
    inputPass.text = 'Ssv@1234';
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
    if (inputPass.text.trim().isEmpty) {
      listErr[1] = 'mật khẩu không được để trống';
      result = false;
    } else if (!regex.hasMatch(inputPass.text.trim())) {
      listErr[1] =
          'mật khẩu phải có 8-16 ký tự chữ và số bao gồm cả chữ hoa, chữ thường và số';
      result = false;
    }
    update();
    return result;
  }

  Future<void> submit(context) async {
    if (!validator) return;
    final form = {
      "email": inputEmail.text.trim(),
      "pass": inputPass.text.trim()
    };

    isLoading(true);
    final res = await api.post('/login', data: form);
    isLoading(false);
    if (res.statusCode == 200 && res.data['code'] == 0) {
      // Utils.messSuccess(context, res.data['message']);
      Navigator.of(context).pushNamed(Routes.TIME_OUT);
      // Get.offAllNamed(Routes.TIME_OUT);
      // Get.rootDelegate.toNamed(Routes.TIME_OUT);
      // Get.rootDelegate.popHistory();
    } else {
      Utils.messError(context, res.data['message']);
    }
    update();
  }
}
