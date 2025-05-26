import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentDetails extends StatelessWidget {
  ParentDetails({super.key});

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
                            controller: formController.parentNameController,
                            hintText: 'Parent Name',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.number,
                            controller: formController.parentNumberController,
                            hintText: 'Parent Number',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.number,
                            controller: formController.parentPassportController,
                            hintText: 'Parent Passport Number',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.number,
                            controller: formController.parentEmiratesController,
                            hintText: 'Parent Emirates ID',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10
                      ])
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        kHeight10,
                        Text('Parent Details *', style: textHeadStyle1),
                        kHeight40,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.name,
                                  controller:
                                      formController.parentNameController,
                                  hintText: 'Parent Name',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()),
                            ),
                            kWidth50,
                            Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.number,
                                  controller:
                                      formController.parentNumberController,
                                  hintText: 'Parent Number',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()),
                            ),
                          ],
                        ),
                        kHeight40,
                        Row(children: [
                          Expanded(
                            child: CustomTextField(
                                validate: Validate.notNull,
                                inputType: TextInputType.number,
                                controller:
                                    formController.parentPassportController,
                                hintText: 'Parent Passport Number',
                                onTapOutside: () =>
                                    FocusScope.of(context).unfocus()),
                          ),
                          kWidth50,
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.number,
                                  controller:
                                      formController.parentEmiratesController,
                                  hintText: 'Parent Emirates ID',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()))
                        ]),
                        kHeight40
                      ])));
  }
}
