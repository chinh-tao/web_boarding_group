import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/home/bindings/home_binding.dart';
import 'package:web_boarding_group/app/modules/home/views/home_view.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({Key? key, required this.pathName}) : super(key: key);

  final String pathName;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (route) {
        switch (pathName) {
          case 'home':
            return GetPageRoute(
                routeName: pathName,
                binding: HomeBinding(),
                page: () => const HomeView());
          default:
            return GetPageRoute(
                routeName: pathName, page: () => const SizedBox.shrink());
        }
      },
    );
  }
}
