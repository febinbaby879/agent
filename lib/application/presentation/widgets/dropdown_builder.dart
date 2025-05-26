import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomDropDownBuilder extends StatefulWidget {
  const CustomDropDownBuilder(
      {super.key,
      required this.items,
      this.selectedvalue,
      this.hintText,
      this.onChanged});

  final List<String> items;
  final String? selectedvalue;
  final String? hintText;
  final Function(String? data)? onChanged;

  @override
  State<CustomDropDownBuilder> createState() => _CustomDropDownBuilderState();
}

class _CustomDropDownBuilderState extends State<CustomDropDownBuilder> {
  TextEditingController searchController = TextEditingController();
  bool containerOpenArrow1 = false;
  bool containerOpenArrow2 = false;

  final Set<String> dropDownItems = {};

  @override
  void initState() {
    super.initState();
    dropDownItems.addAll(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    final isValidValue = widget.selectedvalue == null ||
        dropDownItems.contains(widget.selectedvalue);
    return Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: kRadius5, border: Border.all(color: kpurple400!)),
        child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
                iconStyleData: IconStyleData(
                    icon: containerOpenArrow1
                        ? const Icon(Icons.arrow_drop_up_sharp, color: kBlack)
                        : const Icon(Icons.arrow_drop_down_outlined,
                            color: kBlack)),
                buttonStyleData: ButtonStyleData(
                    decoration:
                        BoxDecoration(color: kWhite, borderRadius: kRadius5),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 40,
                    width: 0),
                hint: Text(widget.hintText ?? 'Hint', style: textStyle1),
                isExpanded: true,
                items: dropDownItems
                    .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,
                            style: textStyle1.copyWith(
                                fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis)))
                    .toSet()
                    .toList(),
                onChanged: widget.onChanged,
                value: isValidValue ? widget.selectedvalue : null,
                dropdownStyleData: DropdownStyleData(
                    decoration:
                        BoxDecoration(borderRadius: kRadius5, color: kWhite),
                    offset: const Offset(0, -5),
                    maxHeight: 250),
                menuItemStyleData: const MenuItemStyleData(height: 40),
                dropdownSearchData: dropdownSearchData(
                    controller: searchController, data: widget.hintText),
                onMenuStateChange: (isOpen) =>
                    setState(() => containerOpenArrow1 = isOpen))));
  }

  DropdownSearchData<String> dropdownSearchData({
    TextEditingController? controller,
    String? data,
  }) =>
      DropdownSearchData(
          searchController: controller,
          searchInnerWidgetHeight: 0,
          searchInnerWidget: Container(
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: kBlack))),
              height: 50,
              child: TextFormField(
                  style: const TextStyle(color: kBlack),
                  controller: controller,
                  decoration: InputDecoration(
                      counterStyle: const TextStyle(color: kWhite),
                      labelStyle: textStyle1,
                      icon: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          child: Icon(Icons.search, color: kBlack)),
                      hintText: 'Search',
                      hintStyle: textThinStyle1.copyWith(color: kBlack)))),
          searchMatchFn: (item, searchValue) => item.value
              .toString()
              .toLowerCase()
              .contains(searchValue.toLowerCase()));
}
