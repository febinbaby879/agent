import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomToast({
  required String message,
  Toast toastLength = Toast.LENGTH_SHORT,
  ToastGravity gravity = ToastGravity.TOP_RIGHT,
  int timeInSecForIosWeb = 3,
  double fontSize = 12.0,
  Color backgroundColor = kBlack,
  Color textColor = kWhite,

  /// left, center or right
  dynamic webPosition = 'right',
  bool webShowClose = true,
}) {
  Fluttertoast.showToast(
    msg: message,
    webShowClose: webShowClose,
    toastLength: toastLength,
    gravity: gravity,
    webPosition: webPosition,
    timeInSecForIosWeb: timeInSecForIosWeb,
    fontSize: fontSize,
    webBgColor: backgroundColor == kRed
        ? "linear-gradient(to right, #FF0000, #FF0000)"
        : "linear-gradient(to right, #000000, #000000)",
    backgroundColor: backgroundColor,
    textColor: textColor,
  );
}
