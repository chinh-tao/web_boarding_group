import 'package:flutter/material.dart';

//192.168.19.91 (CT)
//192.168.0.104 (LN)
const kApiUrlStaging = 'http://192.168.19.91:8000/web';
const kApiUrlProduction = 'https://boarding-group.herokuapp.com/web';

//config color
const kGreyColor_50 = Color(0xfffafafa);
const kSlateColor = Color.fromRGBO(203, 213, 225, 1);
const kBodyText = Color(0xff707070);
const kBlackColor_900 = Color(0xff212121);
const kBlackColor_800 = Color(0xff253439);
const kPrimaryColor = Color(0xff00695c);
const kRedColor_400 = Color(0xFFef5350);
const kRedColor_600 = Color(0xffe53935);
const kGreenColor_700 = Color(0xff689f38);
const kIndegoColor = Color(0xff1976d2);
const kIndigoBlueColor900 = Color(0xff344585);
const kYellowColor_800 = Color(0xfff9a825);
const kYellowColor_200 = Color(0xfffff59d);
const kOrangeColor_800 = Color(0xfffb8c00);

//config message
const MSG_ERR_ADMIN = "Có một lỗi xảy ra, vui lòng liên hệ với admin.";
const MSG_SYSTEM_HANDLE =
    'Lỗi trong quá trình xử lý hệ thống. Vui lòng khởi động lại ứng dụng...';
const MSG_NOT_CONNECT =
    "Không có kết nối mạng, vui lòng khởi động lại ứng dụng sau khi kiểm tra kết nối.";
const MSG_TIME_OUT =
    "Hiện máy chủ đang bận, vui lòng thử lại trong ít phút nữa.";
