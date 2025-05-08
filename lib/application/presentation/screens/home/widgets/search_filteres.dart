import 'package:agent_dashboard/application/controller/home.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/date_picking_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/text_form_field.dart';

class BuildSearchAndFilers extends StatefulWidget {
  const BuildSearchAndFilers({super.key});

  @override
  State<BuildSearchAndFilers> createState() => _BuildSearchAndFilersState();
}

class _BuildSearchAndFilersState extends State<BuildSearchAndFilers> {
  final List<String> _intakeOptions = [
    'Choose Intake',
    'January 2025',
    'May 2025',
    'September 2025'
  ];

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      kHeight5,
      Row(children: [
        const Expanded(child: CustomTextField(hintText: 'Search Course')),
        kWidth5,
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: kpurple400!), borderRadius: kRadius5),
            width: 50,
            height: 50,
            child: Icon(Icons.search, color: kpurple400))
      ]),
      kHeight15,
      Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Text('From Date',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  kHeight10,
                  Row(children: [
                    Expanded(
                        child: CustomTextField(
                            hintText: 'From Date',
                            controller: homeController.fromDateController)),
                    kWidth5,
                    InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                DatePickingShowDialog(
                                    hinttext: 'From Date',
                                    startYear: 200,
                                    endYear: 200,
                                    onPressed: (date) {
                                      homeController.fromDateController.text =
                                          date;
                                      setState(() {});
                                    },
                                    datePicker:
                                        homeController.fromDateController)),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kpurple400!),
                              borderRadius: kRadius5),
                          width: 50,
                          height: 50,
                          child: Icon(Icons.calendar_month, color: kpurple400),
                        ))
                  ])
                ])),
            kWidth15,
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Text('To Date',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  kHeight10,
                  Row(children: [
                    Expanded(
                        child: CustomTextField(
                            hintText: 'To Date',
                            controller: homeController.toDateController)),
                    kWidth5,
                    InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                DatePickingShowDialog(
                                    hinttext: 'To Date',
                                    startYear: 200,
                                    endYear: 200,
                                    onPressed: (date) {
                                      homeController.toDateController.text =
                                          date;
                                      setState(() {});
                                    },
                                    datePicker:
                                        homeController.toDateController)),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kpurple400!),
                              borderRadius: kRadius5),
                          width: 50,
                          height: 50,
                          child: Icon(Icons.calendar_month, color: kpurple400),
                        ))
                  ])
                ])),
            kWidth15,
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Text('Intake',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  kHeight10,
                  Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: kRadius5,
                          border: Border.all(color: kpurple400!)),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              focusColor: kWhite,
                              isExpanded: true,
                              value: homeController.selectedIntake.value,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: _intakeOptions
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item),
                                          ))
                                  .toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  homeController.selectedIntake.value =
                                      newValue ?? "";
                                });
                              })))
                ])),
            Obx(() => homeController.toDateController.text.isNotEmpty ||
                    homeController.fromDateController.text.isNotEmpty ||
                    homeController.selectedIntake.value.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: kpurple400!),
                        borderRadius: kRadius5),
                    width: 50,
                    height: 50,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.done, color: kpurple400)))
                : kEmpty)
          ])
    ]);
  }
}
