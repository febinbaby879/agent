import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/date_picking_bottom_sheet.dart';
import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? textStyle;
  final double width;
  final double height;
  final int startYear;
  final int endYear;

  const DatePickerField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.textStyle,
      this.width = double.infinity,
      this.height = 48,
      required this.startYear,
      required this.endYear});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  void _openDatePicker() => showDialog(
      context: context,
      builder: (BuildContext context) => DatePickingShowDialog(
          hinttext: widget.hintText,
          startYear: widget.startYear,
          endYear: widget.endYear,
          onPressed: (date) {
            widget.controller.text = date;
            setState(() {});
          },
          datePicker: widget.controller));

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: _openDatePicker,
      child: Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
          decoration: BoxDecoration(
              border: Border.all(color: kpurple400!), borderRadius: kRadius5),
          child: Text(
              widget.controller.text.isEmpty
                  ? widget.hintText
                  : widget.controller.text,
              style: widget.controller.text.isEmpty
                  ? widget.textStyle
                  : widget.textStyle?.copyWith(fontWeight: FontWeight.w700))));
}
