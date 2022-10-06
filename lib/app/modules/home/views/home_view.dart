import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Get.rootDelegate.toNamed(Routes.LOGIN),
          child: Text(
            'Content home',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
