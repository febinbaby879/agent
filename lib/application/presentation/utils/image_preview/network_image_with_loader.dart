import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NetworkImageWithLoader extends StatelessWidget {
  final BoxFit fit;

  const NetworkImageWithLoader(
    this.src, {
    super.key,
    this.fit = BoxFit.contain,
    this.radius = 16,
    this.borderRadius,
    this.errorWidget = const Icon(Icons.error),
    this.casheImage = true,
  });

  final String? src;
  final double radius;
  final Widget errorWidget;
  final BorderRadiusGeometry? borderRadius;
  final bool casheImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius)),
      child: !casheImage
          ? Image.network(
              src ?? '',
              fit: fit,
              // loadingBuilder: (context, child, loadingProgress) =>
              //     const ShimmerLoaderTile(),
              // frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              //     const ShimmerLoaderTile(),
              errorBuilder: (context, url, error) => Center(child: errorWidget),
            )
          : CachedNetworkImage(
              fit: fit,
              imageUrl: src ?? '',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit,
                  ),
                ),
              ),

              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              // placeholder: (context, url) => const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Center(child: errorWidget),
            ),
    );
  }
}
