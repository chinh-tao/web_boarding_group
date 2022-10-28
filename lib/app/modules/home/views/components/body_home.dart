import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';

import '../../../../common/config.dart';
import '../../controllers/home_controller.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<HomeController>(builder: (_) {
          return Center(
            child: SizedBox(
              width: 700,
              child: InkWell(
                onTap: () => _.generalRouterDelegate
                    .setPathName(pathName: Routes.ADD_USER),
                child: Card(
                  elevation: 20,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(child: Image.asset('assets/images/logo.png')),
                        const VerticalDivider(
                            color: kBlackColor_900,
                            thickness: 1.3,
                            endIndent: 100,
                            indent: 100),
                        Expanded(
                            child: Column(
                          children: [
                            // CustomInput(
                            //   title: ,
                            //   controller: controller,
                            //    err: err)
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}
