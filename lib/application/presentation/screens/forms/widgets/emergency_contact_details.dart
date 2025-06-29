import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmergencyContactDetails extends StatelessWidget {
  const EmergencyContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;
    final formController = Get.find<ApplicationController>();
    return Form(
        key: formController.accomodationEmergecyFromKey,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 10 : 50),
            child: isWideScreen
                ? Column(children: [
                    kHeight10,
                    Text('Emergency Contact *', style: textHeadStyle1),
                    kHeight40,
                    Row(children: [
                      Expanded(
                          child: CustomTextField(
                              validate: Validate.notNull,
                              inputType: TextInputType.name,
                              controller: formController
                                  .accomodationEmergecyFullNamerController,
                              hintText: 'Full Name',
                              onTapOutside: () =>
                                  FocusScope.of(context).unfocus())),
                      kWidth50,
                      Expanded(
                          child: CustomTextField(
                              validate: Validate.notNull,
                              inputType: TextInputType.text,
                              controller: formController
                                  .accomodationEmergecyRelationshipController,
                              hintText: 'Relationship',
                              onTapOutside: () =>
                                  FocusScope.of(context).unfocus()))
                    ]),
                    kHeight40,
                    Row(children: [
                      Expanded(
                          child: CustomTextField(
                              validate: Validate.notNull,
                              inputType: TextInputType.number,
                              controller: formController
                                  .accomodationEmergecyContactNumberController,
                              hintText: 'Phone Number',
                              onTapOutside: () =>
                                  FocusScope.of(context).unfocus())),
                      kWidth50,
                      Expanded(
                          child: CustomTextField(
                              validate: Validate.email,
                              inputType: TextInputType.emailAddress,
                              controller: formController
                                  .accomodationEmergecyEmailAddresController,
                              hintText: 'Email Address',
                              onTapOutside: () =>
                                  FocusScope.of(context).unfocus()))
                    ])
                  ])
                : Column(children: [
                    kHeight10,
                    Text('Emergency Contact *', style: textHeadStyle1),
                    kHeight40,
                    CustomTextField(
                        validate: Validate.notNull,
                        inputType: TextInputType.name,
                        controller: formController
                            .accomodationEmergecyFullNamerController,
                        hintText: 'Full Name',
                        onTapOutside: () => FocusScope.of(context).unfocus()),
                    kHeight10,
                    CustomTextField(
                        validate: Validate.notNull,
                        inputType: TextInputType.text,
                        controller: formController
                            .accomodationEmergecyRelationshipController,
                        hintText: 'Relationship',
                        onTapOutside: () => FocusScope.of(context).unfocus()),
                    kHeight10,
                    CustomTextField(
                        validate: Validate.notNull,
                        inputType: TextInputType.number,
                        controller: formController
                            .accomodationEmergecyContactNumberController,
                        hintText: 'Phone Number',
                        onTapOutside: () => FocusScope.of(context).unfocus()),
                    kHeight10,
                    CustomTextField(
                        validate: Validate.email,
                        inputType: TextInputType.emailAddress,
                        controller: formController
                            .accomodationEmergecyEmailAddresController,
                        hintText: 'Email Address',
                        onTapOutside: () => FocusScope.of(context).unfocus())
                  ])));
  }
}
