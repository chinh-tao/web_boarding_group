import 'package:flutter/material.dart';
import 'package:web_boarding_group/app/modules/widget/button/primary_button.dart';

import '../../common/config.dart';
import '../../common/primary_style.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading(
      {Key? key,
      required this.isLoading,
      required this.titleButton,
      required this.onPressed,
      this.height = 10,
      this.width = 10,
      this.sizeContent = 16,
      this.colors = kPrimaryColor,
      this.scale = 0.8})
      : super(key: key);

  final bool isLoading;
  final String titleButton;
  final Function()? onPressed;
  final double height, width;
  final double sizeContent, scale;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: height,
        width: width,
        child: PrimaryButton(
            colors: kGreyColor_50,
            content: Center(
                child: Transform.scale(
                    scale: scale,
                    child: CircularProgressIndicator(color: colors))),
            onPressed: null),
      );
    }
    return SizedBox(
      height: height,
      width: width,
      child: PrimaryButton(
          colors: colors,
          content: Text(
            titleButton,
            style: PrimaryStyle.normal(sizeContent),
          ),
          onPressed: onPressed),
    );
  }
}
