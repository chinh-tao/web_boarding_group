import 'package:flutter/material.dart';

import '../../common/config.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.content,
      required this.onPressed,
      this.colors = kIndigoColor900,
      this.radius = 30})
      : super(key: key);

  final Function()? onPressed;
  final Color? colors;
  final Widget content;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: colors,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
        onPressed: onPressed,
        child: content);
  }
}
