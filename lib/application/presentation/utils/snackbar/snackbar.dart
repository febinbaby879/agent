import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showGetxSnackabar(
    {required String message,
    required String title,
    bool isSuccess = false,
    Toast toastLength = Toast.LENGTH_SHORT,
    ToastGravity gravity = ToastGravity.TOP_RIGHT,
    int timeInSecForIosWeb = 2,
    double fontSize = 12.0,
    Color backgroundColor = kBlack,
    Color textColor = kWhite,
    dynamic webPosition = 'right',
    bool webShowClose = true}) {
  Fluttertoast.showToast(
      msg: message,
      webShowClose: webShowClose,
      toastLength: toastLength,
      gravity: gravity,
      webPosition: webPosition,
      timeInSecForIosWeb: timeInSecForIosWeb,
      fontSize: fontSize,
      webBgColor: isSuccess
          ? "linear-gradient(to right, #800080)"
          : "linear-gradient(to right,#ff0000)",
      backgroundColor: backgroundColor,
      textColor: textColor);
}

showSnackbar(String message, BuildContext context, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    behavior: SnackBarBehavior.floating,
  ));
}
