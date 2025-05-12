import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class SearchableDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String> onChanged;
  final String hintText;
  final TextEditingController? controller;
  final Color? borderColor;

  const SearchableDropdown({
    super.key,
    required this.items,
    this.selectedItem,
    required this.onChanged,
    this.hintText = "Select an item",
    this.controller,
    this.borderColor,
  });

  @override
  State<SearchableDropdown> createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<SearchableDropdown> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem ?? widget.controller?.text;
  }

  void _openSearchDialog() async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        String searchText = '';
        List<String> filteredItems = widget.items;

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    autofocus: true,
                    hintText: 'Search',
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                        filteredItems = widget.items
                            .where((item) => item
                                .toLowerCase()
                                .contains(searchText.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredItems[index]),
                          onTap: () {
                            Navigator.pop(context, filteredItems[index]);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedValue = result;
        widget.controller?.text = result;
      });
      widget.onChanged(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onTap: () {
        _openSearchDialog();
      },
      onChanged: (value){
        _openSearchDialog();
      },
      suffixIcon: const Icon(Icons.arrow_drop_down),
      hintText: widget.hintText,
      validate: Validate.notNull,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: TextEditingController(text: selectedValue ?? ""),
    );
  }
}
