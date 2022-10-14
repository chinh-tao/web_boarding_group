import 'package:flutter/material.dart';

import '../../common/config.dart';
import '../../common/primary_style.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.content,
      required this.onPressed,
      this.colors = kIndigoBlueColor900})
      : super(key: key);

  final Function()? onPressed;
  final Color? colors;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: colors,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: onPressed,
        child: content);
  }
}