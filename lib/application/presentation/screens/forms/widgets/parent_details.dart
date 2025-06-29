import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentsDetails extends StatelessWidget {
  ParentsDetails({super.key});

  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;
    return Form(
        key: formController.parentFormKey,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 10 : 50),
            child: !isWideScreen
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        kHeight10,
                        Text('Parent Details *', style: textHeadStyle1),
                        kHeight40,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.name,
                            controller: formController.fatherNameController,
                            hintText: 'Father Name',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.number,
                            controller: formController.fatherNumberController,
                            hintText: 'Father Number',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.emailAddress,
                            controller: formController.fatherEmailController,
                            hintText: 'Father Email ID',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            inputType: TextInputType.number,
                            controller: formController.fatherPassportController,
                            hintText: 'Father Passport Number',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            inputType: TextInputType.text,
                            controller: formController.fatherEmiratesController,
                            hintText: 'Father Emirates ID',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.name,
                            controller: formController.motherNameController,
                            hintText: 'Mother Name',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.number,
                            controller: formController.motherNumberController,
                            hintText: 'Mother Number',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.number,
                            controller: formController.motherEmailController,
                            hintText: 'Mother Email ID',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            inputType: TextInputType.number,
                            controller: formController.motherPassportController,
                            hintText: 'Mother Passport Number',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            inputType: TextInputType.text,
                            controller: formController.motherEmiratesController,
                            hintText: 'Mother Emirates ID',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus())
                      ])
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        kHeight10,
                        Text('Parent Details *', style: textHeadStyle1),
                        kHeight40,
                        Row(children: [
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.name,
                                  controller:
                                      formController.fatherNameController,
                                  hintText: 'Parent Name',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus())),
                          kWidth50,
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.number,
                                  controller:
                                      formController.fatherNumberController,
                                  hintText: 'Parent Number',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()))
                        ]),
                        kHeight40,
                        Row(children: [
                          Expanded(
                              child: CustomTextField(
                                  inputType: TextInputType.number,
                                  controller:
                                      formController.fatherPassportController,
                                  hintText: 'Parent Passport Number',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus())),
                          kWidth50,
                          Expanded(
                              child: CustomTextField(
                                  inputType: TextInputType.number,
                                  controller:
                                      formController.fatherEmiratesController,
                                  hintText: 'Parent Emirates ID',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()))
                        ]),
                        kHeight40,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.emailAddress,
                            controller: formController.fatherEmailController,
                            hintText: 'Father Email ID',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight40,
                        Row(children: [
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.name,
                                  controller:
                                      formController.motherNameController,
                                  hintText: 'Mother Name',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus())),
                          kWidth50,
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.number,
                                  controller:
                                      formController.motherNumberController,
                                  hintText: 'Mother Number',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()))
                        ]),
                        kHeight40,
                        Row(children: [
                          Expanded(
                            child: CustomTextField(
                                validate: Validate.notNull,
                                inputType: TextInputType.number,
                                controller:
                                    formController.motherEmailController,
                                hintText: 'Mother Email ID',
                                onTapOutside: () =>
                                    FocusScope.of(context).unfocus()),
                          ),
                          kWidth50,
                          Expanded(
                              child: CustomTextField(
                                  inputType: TextInputType.number,
                                  controller:
                                      formController.motherPassportController,
                                  hintText: 'Mother Passport Number',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()))
                        ]),
                        kHeight50,
                        CustomTextField(
                            inputType: TextInputType.text,
                            controller: formController.motherEmiratesController,
                            hintText: 'Mother Emirates ID',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus())
                      ])));
  }
}
