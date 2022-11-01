import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/home/bindings/home_binding.dart';
import 'package:web_boarding_group/app/modules/home/views/components/widget/body.dart';
import 'package:web_boarding_group/app/modules/home/views/components/widget/header.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';

import '../../../common/config.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreyColor_50,
      body: Navigator(
        onGenerateRoute: (route) {
          return GetPageRoute(
              binding: HomeBinding(),
              routeName: Routes.HOME,
              page: () => LayoutBuilder(builder: (context, constraints) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const ClampingScrollPhysics(),
                      child: Container(
                        width: maxWidthScreen(constraints.maxWidth),
                        color: kPrimaryColor,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              Header(
                                controller: controller,
                                width: maxWidthScreen(constraints.maxWidth),
                              ),
                              Body(
                                  maxHeight: constraints.maxHeight,
                                  tabController: controller.tabController)
                            ],
                          ),
                        ),
                      ),
                    );
                  }));
        },
      ),
    );
  }

  double maxWidthScreen(double size) {
    if (size < 800) {
      return 400 * 2;
    }
    return size;
  }
}
