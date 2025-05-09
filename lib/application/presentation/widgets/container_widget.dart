import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget(
      {super.key,
      this.children,
      this.horizontalPadding,
      this.horizontalMargin,
      this.onTap,
      this.verticalMargin,
      this.verticalPadding,
      this.backGroundColor,
      this.crossAxisAlignment,
      this.boxShadow,
      this.height,
      this.width,
      this.borderRadius,
      this.mainAxisAlignment,
      this.border,
      this.backGroundImage,
      this.gradientColors});

  final List<Widget>? children;
  final List<Color>? gradientColors;
  final double? horizontalPadding;
  final double? horizontalMargin;
  final VoidCallback? onTap;
  final CrossAxisAlignment? crossAxisAlignment;
  final List<BoxShadow>? boxShadow;
  final Color? backGroundColor;
  final double? verticalMargin;
  final double? verticalPadding;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final MainAxisAlignment? mainAxisAlignment;
  final String? backGroundImage;

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 10,
              vertical: verticalPadding ?? 0),
          width: width ?? double.infinity,
          margin: EdgeInsets.symmetric(
              horizontal: horizontalMargin ?? 0, vertical: verticalMargin ?? 0),
          decoration: BoxDecoration(
              gradient: gradientColors != null
                  ? LinearGradient(colors: gradientColors!)
                  : null,
              image: backGroundImage != null
                  ? DecorationImage(
                      image: NetworkImage(backGroundImage!),
                      fit: BoxFit.cover,
                      opacity: .2)
                  : null,
              borderRadius: borderRadius ?? kRadius10,
              boxShadow: boxShadow ?? boxShadow3,
              color: backGroundColor ?? kWhite,
              border: border),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.start,
              children: children ?? [kEmpty])));
}
