import 'package:flutter/material.dart';

import 'app/modules/common/config.dart';
import 'app/modules/common/primary_style.dart';

class TimeOutView extends StatelessWidget {
  const TimeOutView({Key? key}) : super(key: key);
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
              Text('408!', style: PrimaryStyle.medium(96, color: kSlateColor)),
              const SizedBox(height: 10),
              Text('Phiên làm việc của bạn đã hết hạn',
                  style: PrimaryStyle.medium(30, color: kSlateColor))
            ],
          ),
        ),
      ),
    );
  }
}
