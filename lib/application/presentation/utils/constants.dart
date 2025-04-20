import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const errorMessage = 'Something went wrong, please try again';
const poppins = 'Poppins';

const kEmpty = SizedBox();

final kHeight5 = SizedBox(height: 5.h);
final kHeight10 = SizedBox(height: 10.h);
final kHeight15 = SizedBox(height: 15.h);
final kHeight20 = SizedBox(height: 20.h);
final kHeight30 = SizedBox(height: 30.h);
final kHeight40 = SizedBox(height: 40.h);
final kHeight50 = SizedBox(height: 50.h);
final kHeight60 = SizedBox(height: 60.h);
final kHeight7 = SizedBox(height: 7.h);

final kWidth5 = SizedBox(width: 5.w);
final kWidth10 = SizedBox(width: 10.w);
final kWidth15 = SizedBox(width: 15.w);
final kWidth20 = SizedBox(width: 20.w);
final kWidth30 = SizedBox(width: 30.w);
final kWidth50 = SizedBox(width: 50.w);

final kRadius5 = BorderRadius.circular(5);
final kRadius7 = BorderRadius.circular(7);
final kRadius10 = BorderRadius.circular(10);
final kRadius15 = BorderRadius.circular(15);
final kRadius50 = BorderRadius.circular(50);

TextStyle textHeadStyle1 =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 15.sp, height: 1.9);

TextStyle textStyle1 =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp, height: 1.9);

TextStyle textThinStyle1 =
    TextStyle(fontWeight: FontWeight.w300, fontSize: 11.sp, height: 1.9);

List<BoxShadow> boxShadow1 = const [
  BoxShadow(spreadRadius: 5, blurRadius: 10, offset: Offset(0, 3), color: kGrey)
];
List<BoxShadow> boxShadow2 = const [
  BoxShadow(spreadRadius: 2, blurRadius: 4, offset: Offset(0, 1), color: kGrey)
];
List<BoxShadow> boxShadow3 = const [
  BoxShadow(spreadRadius: 1, blurRadius: 3, offset: Offset(0, 1), color: kGrey)
];

List<BoxShadow> boxShadow4 = [
  const BoxShadow(
      spreadRadius: 2, blurRadius: 5, offset: Offset(0, 1), color: kGrey)
];
