import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_boarding_group/app/common/global.dart';
import 'package:web_boarding_group/app/routes/app_pages.dart';
import 'package:web_boarding_group/app/widget/icon/icon_delete_icons.dart';
import 'package:web_boarding_group/app/widget/icon/icon_tick_icons.dart';
import 'package:web_boarding_group/app/widget/icon/icon_warning_icons.dart';

import '../common/config.dart';
import 'primary_style.dart';

class Utils {
  static void showMessage(
      {required Color color,
      required String text,
      required IconData icons,
      required BuildContext context,
      int duration = 0}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: AlertDialog(
                  title: Icon(icons, color: Colors.white, size: 80),
                  titlePadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(text,
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  actionsPadding: EdgeInsets.zero,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: color,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
          );
        });

    //sau 1s dialog t??? ?????ng t???t
    Future.delayed(Duration(milliseconds: duration), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
  }

  static void messWarning(BuildContext context, String content) {
    showMessage(
        duration: 2000,
        icons: IconWarning.info_circled_alt,
        color: kYellowColor_800,
        text: content,
        context: context);
  }

  static void messError(BuildContext context, String content) {
    showMessage(
        duration: 2000,
        icons: IconDelete.cancel_circled2,
        color: kRedColor_400,
        text: content,
        context: context);
  }

  static void messSuccess(BuildContext context, String content) {
    showMessage(
        duration: 1500,
        icons: IconTick.ok_circled2,
        color: kGreenColor_700,
        text: content,
        context: context);
  }

  static void showMessPopup(BuildContext context,
      {required String content, Function()? onPressed}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Text(content,
                style: PrimaryStyle.medium(20, color: kIndigoColor900)),
            contentPadding:
                const EdgeInsets.only(bottom: 5, top: 23, left: 20, right: 20),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'h???y',
                    style: PrimaryStyle.medium(18, color: kIndigoColor900),
                  )),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'x??c nh???n',
                    style: PrimaryStyle.medium(18, color: kRedColor_400),
                  ))
            ],
          );
        });
  }

  static List<String> get routerName {
    var result = <String>['null'];
    for (var data in AppPages.routes) {
      result.add(data.name);
    }
    return result;
  }

  static double get maxWidthScreen {
    if (maxWidth < 800) {
      return 400 * 2;
    }
    return maxWidth;
  }

  static double get maxHeightBody {
    if (maxHeight < 630) {
      return 729;
    }
    return maxHeight - 110;
  }
}
