import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/container_image.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatefulWidget {
  const BackgroundImage(
      {super.key,
      required this.image,
      required this.isHovered,
      this.backgroundImageOpacity,
      this.wantBlackShade = true,
      this.isNetWorkImage = true,
      this.wantRadius = true,
      this.borderRadius,
      this.shadeForLeftSide = false,
      this.leftSideDarknessOpacity});

  final String image;
  final bool isHovered;
  final double? backgroundImageOpacity;
  final double? leftSideDarknessOpacity;
  final bool wantBlackShade;

  final bool isNetWorkImage;
  final bool wantRadius;
  final double? borderRadius;
  final bool shadeForLeftSide;

  @override
  State<BackgroundImage> createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
              child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                      begin: 1.0, end: widget.isHovered ? 1.15 : 1.0),
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutCubic,
                  builder: (context, scale, child) =>
                      Transform.scale(scale: scale, child: child),
                  child: ContainerImage(
                      borderRadius: widget.borderRadius,
                      wantRadius: widget.wantRadius,
                      image: widget.image,
                      isNetwork: widget.isNetWorkImage,
                      width: double.infinity,
                      fit: BoxFit.cover)))),
      widget.wantBlackShade
          ? widget.shadeForLeftSide
              ? Positioned.fill(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius ?? 12),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black.withOpacity(
                                  widget.leftSideDarknessOpacity ?? 0.4),
                              Colors.black.withOpacity(
                                  widget.leftSideDarknessOpacity != null
                                      ? (widget.leftSideDarknessOpacity! - 0.1)
                                          .clamp(0.0, 1.0)
                                      : 0.4),
                              Colors.black.withOpacity(0.3)
                            ],
                          ))))
              : Positioned.fill(
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius ?? 12),
                          color: Colors.black.withOpacity(
                              widget.backgroundImageOpacity ?? 0.4))))
          : kEmpty
    ]);
  }
}
