import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/config.dart';
import 'primary_style.dart';

class Utils {
  static void showMessage(
      {required Color color,
      required String text,
      int duration = 0,
      AlignmentGeometry alignment = Alignment.center,
      TextAlign textAlign = TextAlign.center,
      Function()? onPressed}) {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Column(children: [
              Align(
                alignment: alignment,
                child: Text(text,
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: textAlign),
              ),
              if (duration == 0) ...[
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 15),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size(100, 45),
                          side:
                              const BorderSide(color: Colors.white, width: 2)),
                      onPressed: onPressed,
                      child: const Text("OK",
                          style: TextStyle(fontSize: 14, color: Colors.white))),
                )
              ]
            ]),
            titlePadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            content: SizedBox(width: Get.width),
            contentPadding: EdgeInsets.zero,
            actionsPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            backgroundColor: color,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(0))),
          );
        });

    //sau 1s dialog tự động tắt
    if (duration != 0) {
      Future.delayed(Duration(milliseconds: duration), () {
        Get.back();
      });
    }
  }

  static void messWarning(String content) {
    showMessage(
        onPressed: () => Get.back(),
        alignment: Alignment.centerLeft,
        textAlign: TextAlign.left,
        color: kYellowColor_800,
        text: content);
  }

  static void messError(String content) {
    showMessage(
        onPressed: () => Get.back(),
        alignment: Alignment.centerLeft,
        textAlign: TextAlign.left,
        color: kRedColor_600,
        text: content);
  }

  static void messSuccess(String content) {
    showMessage(
        duration: 1500,
        alignment: Alignment.center,
        textAlign: TextAlign.left,
        color: kGreenColor_700,
        text: content);
  }

  static void showMessPopup({required String content, Function()? onPressed}) {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Text(content,
                style: PrimaryStyle.medium(20, color: kIndigoBlueColor900)),
            contentPadding:
                const EdgeInsets.only(bottom: 5, top: 23, left: 20, right: 20),
            actions: [
              TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'hủy',
                    style: PrimaryStyle.medium(18, color: kIndigoBlueColor900),
                  )),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'xác nhận',
                    style: PrimaryStyle.medium(18, color: kRedColor_400),
                  ))
            ],
          );
        });
  }
}
