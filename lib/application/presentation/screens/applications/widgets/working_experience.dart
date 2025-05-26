import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkExperience extends StatelessWidget {
  const WorkExperience({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 10 : 50),
        child: !isWideScreen
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                kHeight10,
                Text('Work Experience (for working students)',
                    style: textHeadStyle1),
                kHeight40,
                CustomTextField(
                    validate: Validate.notNull,
                    inputType: TextInputType.number,
                    controller: formController.workExperienceController,
                    hintText: 'Work Experience',
                    onTapOutside: () => FocusScope.of(context).unfocus()),
                kHeight10,
                CustomTextField(
                    validate: Validate.notNull,
                    inputType: TextInputType.text,
                    controller: formController.positionController,
                    hintText: 'Position',
                    onTapOutside: () => FocusScope.of(context).unfocus()),
                kHeight10,
                CustomTextField(
                    validate: Validate.notNull,
                    inputType: TextInputType.streetAddress,
                    controller: formController.companyAddressController,
                    hintText: 'Company Address',
                    onTapOutside: () => FocusScope.of(context).unfocus()),
                kHeight10,
                CustomTextField(
                    validate: Validate.notNull,
                    inputType: TextInputType.number,
                    controller: formController.companyContactNumberController,
                    hintText: 'Company Contact Number',
                    onTapOutside: () => FocusScope.of(context).unfocus())
              ])
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                kHeight10,
                Text('Work Experience (for working students)',
                    style: textHeadStyle1),
                kHeight40,
                Row(children: [
                  Expanded(
                      child: CustomTextField(
                          validate: Validate.notNull,
                          inputType: TextInputType.number,
                          controller: formController.workExperienceController,
                          hintText: 'Work Experience',
                          onTapOutside: () =>
                              FocusScope.of(context).unfocus())),
                  kWidth50,
                  Expanded(
                      child: CustomTextField(
                          validate: Validate.notNull,
                          inputType: TextInputType.text,
                          controller: formController.positionController,
                          hintText: 'Position',
                          onTapOutside: () => FocusScope.of(context).unfocus()))
                ]),
                kHeight40,
                Row(children: [
                  Expanded(
                    child: CustomTextField(
                        validate: Validate.notNull,
                        inputType: TextInputType.streetAddress,
                        controller: formController.companyAddressController,
                        hintText: 'Company Address',
                        onTapOutside: () => FocusScope.of(context).unfocus()),
                  ),
                  kWidth50,
                  Expanded(
                      child: CustomTextField(
                          validate: Validate.notNull,
                          inputType: TextInputType.number,
                          controller:
                              formController.companyContactNumberController,
                          hintText: 'Company Contact Number',
                          onTapOutside: () => FocusScope.of(context).unfocus()))
                ])
              ]));
  }
}
