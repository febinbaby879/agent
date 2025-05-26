import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgencyDetails extends StatelessWidget {
  const AgencyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 10 : 50),
        child: !isWideScreen
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                kHeight40,
                Text('Agency Details', style: textHeadStyle1),
                kHeight40,
                CustomTextField(
                    validate: Validate.notNull,
                    inputType: TextInputType.text,
                    controller: formController.agentaNameController,
                    hintText: 'Agent Name',
                    onTapOutside: () => FocusScope.of(context).unfocus()),
                kHeight10,
                CustomTextField(
                    validate: Validate.notNull,
                    inputType: TextInputType.number,
                    controller: formController.agentMobileNumberController,
                    hintText: 'Agent Mobile Number',
                    onTapOutside: () => FocusScope.of(context).unfocus()),
                kHeight10,
                CustomTextField(
                    validate: Validate.email,
                    inputType: TextInputType.emailAddress,
                    controller: formController.agentEmailIDController,
                    hintText: 'Email ID',
                    onTapOutside: () => FocusScope.of(context).unfocus()),
                kHeight10,
                CustomTextField(
                    validate: Validate.notNull,
                    inputType: TextInputType.text,
                    controller: formController.agentCountryController,
                    hintText: 'Country',
                    onTapOutside: () => FocusScope.of(context).unfocus())
              ])
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                kHeight40,
                Text('Agency Details', style: textHeadStyle1),
                kHeight40,
                Row(children: [
                  Expanded(
                      child: CustomTextField(
                          validate: Validate.notNull,
                          inputType: TextInputType.text,
                          controller: formController.agentaNameController,
                          hintText: 'Agent Name',
                          onTapOutside: () =>
                              FocusScope.of(context).unfocus())),
                  kWidth50,
                  Expanded(
                      child: CustomTextField(
                          validate: Validate.notNull,
                          inputType: TextInputType.number,
                          controller:
                              formController.agentMobileNumberController,
                          hintText: 'Agent Mobile Number',
                          onTapOutside: () => FocusScope.of(context).unfocus()))
                ]),
                kHeight40,
                Row(children: [
                  Expanded(
                      child: CustomTextField(
                          validate: Validate.email,
                          inputType: TextInputType.emailAddress,
                          controller: formController.agentEmailIDController,
                          hintText: 'Email ID',
                          onTapOutside: () =>
                              FocusScope.of(context).unfocus())),
                  kWidth50,
                  Expanded(
                    child: CustomTextField(
                        validate: Validate.notNull,
                        inputType: TextInputType.text,
                        controller: formController.agentCountryController,
                        hintText: 'Country',
                        onTapOutside: () => FocusScope.of(context).unfocus()),
                  )
                ])
              ]));
  }
}
