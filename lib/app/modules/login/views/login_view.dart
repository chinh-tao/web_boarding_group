import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/login/bindings/login_binding.dart';
import 'package:web_boarding_group/app/modules/login/views/components/body_login.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';

import '../../../common/config.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Navigator(
        onGenerateRoute: (route) {
          return GetPageRoute(
              binding: LoginBinding(),
              routeName: Routes.LOGIN,
              page: () => const BodyLogin());
        },
      ),
    );
  }
}
