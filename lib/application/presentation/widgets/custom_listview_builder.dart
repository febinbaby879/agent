import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({
    super.key,
    this.physics,
    this.separator,
    this.scrollDirection,
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
  });

  final Widget? Function({required BuildContext context, required int index})
      itemBuilder;
  final int itemCount;
  final ScrollPhysics? physics;
  final Axis? scrollDirection;
  final SizedBox? separator;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) => ListView.separated(
      controller: controller,
      separatorBuilder: (context, index) => separator ?? kEmpty,
      padding: const EdgeInsets.all(0),
      physics: physics ?? const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      scrollDirection: scrollDirection ?? Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, featureIndex) =>
          itemBuilder(context: context, index: featureIndex));
}
