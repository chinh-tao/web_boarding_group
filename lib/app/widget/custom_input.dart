import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/config.dart';
import '../common/primary_style.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {Key? key,
      required this.controller,
      this.err = '',
      this.title = '',
      this.colorTitle = kBodyText,
      this.maxLength,
      this.inputFormatters,
      this.keyboardType,
      this.obscureText = false,
      this.onPressed,
      this.icons,
      this.readOnly = false,
      this.hintText = '',
      this.background = kGreyColor_50,
      this.button,
      this.isBorderErr = true,
      this.paddingLeft = 0})
      : super(key: key);

  final TextEditingController controller;
  final String title, err, hintText;
  final Color? colorTitle, background;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool obscureText, readOnly, isBorderErr;
  final Widget? icons, button;
  final Function()? onPressed;
  final double paddingLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.only(left: paddingLeft),
            child: Text(title, style: PrimaryStyle.bold(16, color: colorTitle)),
          ),
          const SizedBox(height: 5)
        ],
        Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 47,
                child: TextField(
                  controller: controller,
                  style: PrimaryStyle.medium(14,
                      color: kBodyText.withOpacity(0.83)),
                  maxLength: maxLength,
                  inputFormatters: inputFormatters,
                  keyboardType: keyboardType ?? TextInputType.visiblePassword,
                  obscureText: obscureText,
                  readOnly: readOnly,
                  decoration: InputDecoration(
                      fillColor: background,
                      filled: background != null ? true : false,
                      hintText: hintText,
                      hintStyle: PrimaryStyle.normal(17,
                          color: kBodyText.withOpacity(0.5)),
                      suffixIcon: icons,
                      counter: const SizedBox.shrink(),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                              width: 2,
                              color: isBorderErr
                                  ? kBlackColor_900.withOpacity(0.3)
                                  : kRedColor_400)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: readOnly
                              ? BorderSide(
                                  width: 2,
                                  color: kBlackColor_900.withOpacity(0.3))
                              : BorderSide(
                                  color: kIndegoColor.withOpacity(0.8),
                                  width: 2))),
                ),
              ),
            ),
            if (button != null) ...[
              const SizedBox(width: 10),
              Expanded(flex: 1, child: button!)
            ]
          ],
        ),
        if (err.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child:
                Text(err, style: PrimaryStyle.normal(13, color: kRedColor_400)),
          )
        ]
      ],
    );
  }
}
