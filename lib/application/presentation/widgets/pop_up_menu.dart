import 'package:flutter/material.dart';

class PopUpMenuButtonWidget extends StatelessWidget {
  const PopUpMenuButtonWidget(
      {super.key,
      required this.items,
      this.selectedValue,
      this.hintText,
      this.textColor,
      this.child,
      this.height,
      this.width,
      this.textStyle,
      this.tooltip,
      this.decoration,
      this.onSelected});
  final List<String> items;
  final String? selectedValue;
  final String? hintText;
  final String? tooltip;
  final Function(String value)? onSelected;
  final Color? textColor;
  final Widget? child;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: tooltip,
      onSelected: onSelected,
      itemBuilder: (context) => items
          .map((item) => PopupMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle ??
                      Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ))
          .toList(),
      child: child ??
          Container(
            height: height,
            width: width,
            decoration: decoration ??
                BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(4),
                ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    hintText ?? selectedValue ?? 'Select',
                    overflow: TextOverflow.ellipsis,
                    style: textStyle ??
                        Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: textColor),
                  ),
                ),
                // const Spacer(),
                const Icon(Icons.keyboard_arrow_down_rounded, size: 16),
              ],
            ),
          ),
    );
  }
}
