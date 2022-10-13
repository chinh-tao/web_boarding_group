import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'common/config.dart';
import 'common/primary_style.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBlackColor_800,
      body: SizedBox(
        width: _size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: _size.height / 5),
              Text('404!', style: PrimaryStyle.medium(96, color: kSlateColor)),
              const SizedBox(height: 10),
              Text('Không tìm thấy trang bạn yêu cầu',
                  style: PrimaryStyle.medium(30, color: kSlateColor))
            ],
          ),
        ),
      ),
    );
  }
}
