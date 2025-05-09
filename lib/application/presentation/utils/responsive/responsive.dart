import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.desktop,
    required this.largeMobile,
    required this.mobile,
    this.betweenMobileAndLargeMobile,
    this.tablet,
    this.extraLargeScreen,
  });

  final Widget desktop;
  final Widget largeMobile;
  final Widget mobile;
  final Widget? betweenMobileAndLargeMobile;
  final Widget? tablet;
  final Widget? extraLargeScreen;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isExtraLargeDesktop(context) && extraLargeScreen != null) {
      return extraLargeScreen!;
    } else if (Responsive.isDesktop(context)) {
      return desktop;
    } else if (Responsive.isTab(context)) {
      return largeMobile;
    } else {
      return mobile;
    }
  }
}

class Responsive {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 400;
  }

  static bool isTab(BuildContext context) {
    return MediaQuery.of(context).size.width > 400 &&
        MediaQuery.of(context).size.width < 700;
  }

  static bool isSmallDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 700 &&
        MediaQuery.of(context).size.width < 900;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 700;
  }

  static bool isExtraLargeDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 1400;
  }
}
