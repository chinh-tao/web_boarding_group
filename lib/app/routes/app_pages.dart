import 'package:get/get.dart';

import '../modules/add_user/bindings/add_user_binding.dart';
import '../modules/add_user/views/add_user_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/not_found_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NOT_FOUND,
      page: () => const NotFoundView(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASS,
      page: () => const LoginView(),
    ),
    GetPage(
      name: _Paths.ADD_USER,
      page: () => const AddUserView(),
      binding: AddUserBinding(),
    ),
  ];
}
