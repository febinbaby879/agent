import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class BullletPoints extends StatelessWidget {
  const BullletPoints(
      {super.key,
      required this.texts,
      this.subTexts,
      this.pointStyle,
      this.style});

  final List<String> texts;
  final List<String>? subTexts;
  final Widget? pointStyle;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            texts.length,
            (index) => Column(children: [
                  kHeight5,
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    pointStyle ??
                        Text('• ',
                            style: textHeadStyle1.copyWith(
                                color: kBlack, fontSize: 14)),
                    kWidth5,
                    Expanded(
                        child: Text(texts[index],
                            style: style ??
                                textStyle1.copyWith(
                                    fontSize: 12.3,
                                    fontWeight: FontWeight.w700)))
                  ]),
                  subTexts != null && subTexts!.isNotEmpty ? kHeight5 : kEmpty,
                  subTexts != null && subTexts!.isNotEmpty
                      ? Text(subTexts![index])
                      : kEmpty
                ])));
  }
}
