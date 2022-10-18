import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_boarding_group/app/common/global.dart';

import '../../../common/config.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kGreyColor_50,
      body: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 700,
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
            )
          ],
        ),
      ),
    );
  }
}
