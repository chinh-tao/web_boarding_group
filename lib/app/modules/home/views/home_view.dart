import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_boarding_group/app/modules/add_user/bindings/add_user_binding.dart';
import 'package:web_boarding_group/app/modules/add_user/views/add_user_view.dart';
import 'package:web_boarding_group/app/modules/home/bindings/home_binding.dart';
import 'package:web_boarding_group/app/modules/home/views/components/body_home.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';

import '../../../common/config.dart';
import '../../../common/primary_style.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kGreyColor_50,
      body: Navigator(
        onGenerateRoute: (route) {
          return GetPageRoute(
              binding: HomeBinding(),
              routeName: Routes.HOME,
              page: () => Container(
                    width: size.width,
                    height: size.height,
                    color: kPrimaryColor,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 110,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: CircleAvatar(
                                          backgroundColor: kOrangeColor_800,
                                          radius: 80,
                                          child: Text('c'.toUpperCase(),
                                              style: PrimaryStyle.bold(43,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Nguyễn thị vân',
                                              style: PrimaryStyle.normal(20,
                                                  color: Colors.white)),
                                          const SizedBox(height: 2),
                                          Text('chinhtao1908@gmail.com',
                                              style: PrimaryStyle.normal(15,
                                                  color: Colors.white)),
                                        ],
                                      )
                                    ],
                                  )),
                                  Expanded(
                                      child: Row(
                                    children: [
                                      itemMenuTab('Thêm thành viên'),
                                      itemMenuTab('Danh sách thành viên')
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: maxHeightContent(size.height),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 10,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
        },
      ),
    );
  }

  Widget itemMenuTab(String content) {
    return Container(
      padding: const EdgeInsets.all(7),
      // decoration: const BoxDecoration(
      //     border: Border(bottom: BorderSide(color: Colors.white, width: 2))),
      child: Text(content, style: PrimaryStyle.normal(14, color: Colors.white)),
    );
  }

  double maxHeightContent(double size) {
    if (size < 839) {
      return 729;
    }
    return size;
  }
}
