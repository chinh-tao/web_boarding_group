import 'package:flutter/material.dart';
import 'package:web_boarding_group/app/common/utils.dart';

import '../body/add_member.dart';
import '../body/create_invoice.dart';
import '../body/list_member.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.tabController}) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.maxHeightBody,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [ListMemeber(), AddMember(), CreateInvoice()]),
    );
  }
}
