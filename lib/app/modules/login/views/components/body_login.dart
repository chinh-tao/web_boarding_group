import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';
import '../../../../common/config.dart';
import '../../../../common/primary_style.dart';
import '../../../../widget/button/button_loading.dart';
import '../../../../widget/custom_input.dart';
import '../../controllers/login_controller.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({Key? key}) : super(key: key);

  String showButtonText(LoginController controller) {
    if (controller.generalRouterDelegate.pathName == Routes.FORGOT_PASS) {
      return 'Đăng nhập tài khoản?';
    }
    return 'Quên mật khẩu?';
  }

  String showTextButton(LoginController controller) {
    if (controller.generalRouterDelegate.pathName == Routes.FORGOT_PASS) {
      return 'Gửi';
    }
    return 'Đăng nhập';
  }

  IconData showIcons(LoginController controller) {
    if (controller.isObscureText.value) {
      return Icons.visibility_off_outlined;
    }
    return Icons.visibility_outlined;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SingleChildScrollView(
          child: Stack(
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
                                      if (_.generalRouterDelegate.pathName ==
                                          null) ...[
                                        const SizedBox(height: 10),
                                        CustomInput(
                                            title: 'Mật khẩu',
                                            obscureText: _.isObscureText.value,
                                            icons: IconButton(
                                                hoverColor: Colors.transparent,
                                                splashColor: Colors.transparent,
                                                onPressed: () {
                                                  _.isObscureText(
                                                      !_.isObscureText.value);
                                                  _.update();
                                                },
                                                icon: Icon(showIcons(_),
                                                    color: kPrimaryColor)),
                                            controller: _.inputPass,
                                            isBorderErr: _.listErr[1].isEmpty,
                                            err: _.listErr[1])
                                      ],
                                      SizedBox(
                                          height:
                                              _.listErr.contains("") ? 30 : 15),
                                      ButtonLoading(
                                          height: 45,
                                          width: 150,
                                          sizeContent: 15,
                                          isLoading: _.isLoading.value,
                                          titleButton: showTextButton(_),
                                          onPressed: () => _.submit(context)),
                                    ],
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 0,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () => _.transport(),
                                        child: Text(
                                          showButtonText(_),
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
