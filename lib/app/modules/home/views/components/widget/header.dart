import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:web_boarding_group/app/common/utils.dart';
import 'package:web_boarding_group/app/modules/home/controllers/home_controller.dart';
import '../../../../../common/config.dart';
import '../../../../../common/primary_style.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final admin = controller.authController.admin.value;

    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Utils.maxWidthScreen / 3,
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: CircleAvatar(
                      backgroundColor: kOrangeColor_800,
                      radius: 80,
                      child: Text(showNameCircle.toUpperCase(),
                          style: PrimaryStyle.bold(43, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(admin.getName,
                          style: PrimaryStyle.normal(20, color: Colors.white)),
                      const SizedBox(height: 2),
                      Text(admin.getEmail,
                          style: PrimaryStyle.normal(15, color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: Utils.maxWidthScreen / 2,
              child: Container(
                margin: const EdgeInsets.only(top: 40),
                alignment: Alignment.centerRight,
                child: TabBar(
                    indicatorWeight: 3.3,
                    indicator: BoxDecoration(
                        border: Border.all(color: kYellowColor_200, width: 2.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: controller.tabController,
                    labelColor: kYellowColor_200, //<-- selected text color
                    unselectedLabelColor: Colors.white,
                    padding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 17),
                    indicatorPadding: EdgeInsets.zero,
                    isScrollable: true,
                    tabs: [
                      itemMenuTab(index: 0, content: 'Duyệt thành viên'),
                      itemMenuTab(index: 1, content: 'Thêm thành viên'),
                      itemMenuTab(index: 2, content: 'Tạo hoá đơn')
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemMenuTab({required int index, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(top: 9, bottom: 6),
      child: Text(content, style: PrimaryStyle.normal(14)),
    );
  }

  String get showNameCircle {
    final admin = controller.authController.admin.value;
    if (admin.getName == '') {
      return '';
    } else {
      final lastName = admin.getName.split(' ');
      return lastName[2][0];
    }
  }
}
