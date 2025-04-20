import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerImage extends StatelessWidget {
  const ContainerImage(
      {super.key,
      required this.image,
      this.width,
      this.height,
      this.isNetwork = false,
      this.fit,
      this.borderRadius,
      this.border,
      this.wantRadius = true,
      this.horizontalMargin,
      this.onTap});
  final String image;
  final double? height;
  final double? width;
  final bool wantRadius;
  final double? horizontalMargin;
  final BoxFit? fit;
  final BoxBorder? border;
  final double? borderRadius;
  final bool isNetwork;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 20.w),
            decoration: BoxDecoration(
                borderRadius: borderRadius != null
                    ? BorderRadius.circular(borderRadius!)
                    : kRadius10,
                border: border),
            child: ClipRRect(
                borderRadius: !wantRadius
                    ? BorderRadius.circular(0)
                    : borderRadius != null
                        ? BorderRadius.circular(borderRadius!)
                        : kRadius10,
                child: isNetwork
                    ? Image.network(
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image),
                        height: height,
                        width: width,
                        image,
                        fit: fit ?? BoxFit.cover)
                    : Image.asset(
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.image),
                        height: height ?? 10.h,
                        width: width ?? 10.w,
                        image,
                        fit: fit ?? BoxFit.cover))));
  }
}
