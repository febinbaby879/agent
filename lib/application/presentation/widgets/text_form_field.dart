import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/validators/text_feild_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onTap,
    this.isBorder = false,
    this.fillColor,
    this.textCapitalization,
    this.focusNode,
    this.showUnderline = false,
    this.validate = Validate.none,
    this.onTapOutside,
    this.obscureText = false,
    this.maxLines,
    this.inputType = TextInputType.name,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.clr,
    this.enabledBorder,
    this.password,
    this.borderRadius = 8,
    this.autofocus = false,
    this.onChanged,
    this.maxLength,
    this.lebelText,
    this.focusedBorder,
    this.autovalidateMode,
    this.inputFormatters = const <TextInputFormatter>[],
  });

  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Color? clr;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final VoidCallback? onTapOutside;
  final bool showUnderline;
  final TextInputType? inputType;
  final Validate validate;
  final String hintText;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final bool isBorder;
  final Color? fillColor;
  final TextCapitalization? textCapitalization;
  final bool obscureText;
  final bool autofocus;
  final TextEditingController? password;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final double borderRadius;
  final Function(String value)? onChanged;
  final List<TextInputFormatter> inputFormatters;
  final String? lebelText;
  final AutovalidateMode? autovalidateMode;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showEye = false;

  @override
  void initState() {
    super.initState();
    showEye = widget.obscureText;
  }

  EdgeInsets calculateContentPadding() {
    if (widget.maxLines != null && widget.maxLines! > 1) {
      return const EdgeInsets.symmetric(horizontal: 15, vertical: 10);
    }
    return const EdgeInsets.symmetric(horizontal: 15);
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        autovalidateMode: widget.autovalidateMode,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.inputType,
        onChanged: widget.onChanged,
        maxLines: widget.maxLines ?? 1,
        maxLength: widget.maxLength,
        style: textStyle1.copyWith(fontWeight: FontWeight.w700),
        obscureText: showEye,
        autofocus: widget.autofocus,
        cursorHeight: 17,
        cursorWidth: 2.2,
        onTapOutside: (event) => widget.onTapOutside != null
            ? widget.onTapOutside!()
            : FocusScope.of(context).unfocus(),
        onTap: widget.onTap,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        controller: widget.controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: kpurple400!)),
            hintStyle: textStyle1,
            prefixIconConstraints: BoxConstraints.tight(const Size(43, 30)),
            labelText: widget.lebelText,
            errorMaxLines: 5,
            fillColor: widget.fillColor ?? kWhite,
            filled: true,
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(7)),
            enabledBorder: widget.enabledBorder ??
                OutlineInputBorder(borderSide: BorderSide(color: kpurple400!)),
            focusedBorder: widget.focusedBorder,
            counter: const SizedBox.shrink(),
            contentPadding: calculateContentPadding(),
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () => setState(() => showEye = !showEye),
                    icon: Icon(
                        showEye
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: kPurple))
                : widget.suffixIcon,
            prefix: widget.prefix,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText),
        validator: (value) => ValidationTextField.validateTextField(
          labelText: widget.hintText,
          validate: widget.validate,
          value: value,
          password: widget.password?.text,
        ),
      );
}
