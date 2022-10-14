import 'package:get/get.dart';
import 'package:web_boarding_group/app/model/admin_model.dart';

class AuthController extends GetxController {
  final admin = AdminModel().obs;

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

  void initData() {}
}
