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
    webBgColor: "linear-gradient(to right, #000000, #000000)",
    backgroundColor: backgroundColor,
    textColor: textColor,
  );
}
