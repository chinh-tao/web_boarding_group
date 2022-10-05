import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/modules/common/rootDelegate.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp.router(
      title: "Boarding Group",
      getPages: AppPages.routes,
      routerDelegate: AppRouterDelegate(),
    ),
  );
}
