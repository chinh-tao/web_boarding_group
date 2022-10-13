import 'package:flutter/material.dart';
import 'package:web_boarding_group/app/modules/common/config.dart';
import 'package:web_boarding_group/app/modules/common/primary_style.dart';
import 'package:web_boarding_group/app/modules/widget/icon/icon_network_icons.dart';

class NotConnectView extends StatelessWidget {
  const NotConnectView({Key? key}) : super(key: key);
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
              const Icon(IconNetwork.globe, color: kSlateColor, size: 220),
              const SizedBox(height: 10),
              Text('Không có kết nối mạng',
                  style: PrimaryStyle.medium(30, color: kSlateColor))
            ],
          ),
        ),
      ),
    );
  }
}
