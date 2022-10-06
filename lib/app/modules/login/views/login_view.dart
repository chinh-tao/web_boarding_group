import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/common/primary_style.dart';
import 'package:web_boarding_group/app/modules/widget/button/button_loading.dart';

import '../../common/config.dart';
import '../../widget/custom_input.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 700,
                height: 340,
                child: Card(
                  elevation: 20,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(child: Image.asset('assets/images/logo.png')),
                        const VerticalDivider(
                            color: kPrimaryColor,
                            thickness: 3,
                            endIndent: 30,
                            indent: 30),
                        Expanded(
                            child: GetBuilder<LoginController>(builder: (_) {
                          return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 40),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      CustomInput(
                                          title: 'Tài khoản email',
                                          controller: _.inputEmail,
                                          isBorderErr: _.listErr[0].isEmpty,
                                          err: _.listErr[0]),
                                      const SizedBox(height: 10),
                                      CustomInput(
                                          title: 'Mật khẩu',
                                          controller: _.inputPass,
                                          isBorderErr: _.listErr[1].isEmpty,
                                          err: _.listErr[1]),
                                      SizedBox(
                                          height:
                                              _.listErr.contains("") ? 30 : 15),
                                      ButtonLoading(
                                          height: 45,
                                          width: 150,
                                          sizeContent: 15,
                                          isLoading: _.isLoading.value,
                                          titleButton: 'Đăng nhập',
                                          onPressed: () async =>
                                              await _.submit()),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 0,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {},
                                        child: Text(
                                          'Quên mật khẩu?',
                                          style: PrimaryStyle.normal(14),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ));
                        }))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
