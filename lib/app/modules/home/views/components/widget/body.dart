import 'package:flutter/material.dart';

import '../body/add_member.dart';
import '../body/create_invoice.dart';
import '../body/list_member.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.maxHeight, required this.tabController})
      : super(key: key);

  final double maxHeight;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeightBody(maxHeight),
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

  double maxHeightBody(double size) {
    if (size < 829) {
      return 729;
    }
    return size;
  }
}
