import 'dart:async';
import 'dart:ui';

import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:web_boarding_group/app/modules/auth/auth_binding.dart';
import 'app/common/api.dart';
import 'app/common/config.dart';
import 'app/common/custom_interceptor.dart';
import 'app/widget/router_delegate/general_route_information_parser.dart';
import 'app/widget/router_delegate/general_router_delegate.dart';

final _log = Logger();

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());

    api.options
      ..connectTimeout = 10000
      ..validateStatus = (int? status) => status != null && status > 0;
    api.interceptors.addAll([
      CustomInterceptors(),
      RetryInterceptor(
          dio: api,
          logPrint: print,
          retryDelays: [
            const Duration(seconds: 5),
            const Duration(seconds: 10),
            const Duration(seconds: 20)
          ],
          retries: 3)
    ]);
  }, (err, stackTrace) {
    _log.e("App Error: $err");
    _log.d("StackTrace: $stackTrace");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior().copyWith(scrollbars: false),
        title: "Boarding Group",
        routerDelegate: GeneralRouterDelegate(),
        routeInformationParser: GeneralRouteInformationParser(),
        initialBinding: AuthBinding(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: kBodyText, displayColor: kBodyText)));
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
