import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentAddress extends StatelessWidget {
  const CurrentAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;
    return Form(
        key: formController.currentAddressFormKey,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 10 : 50),
            child: !isWideScreen
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        kHeight10,
                        Text('Current Address *', style: textHeadStyle1),
                        kHeight40,
                        CustomTextField(
                            maxLines: 3,
                            validate: Validate.notNull,
                            inputType: TextInputType.streetAddress,
                            controller: formController.addressController,
                            hintText: 'Address',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            controller: formController.emiratesStatesController,
                            hintText: 'Emirates/States',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            controller: formController.countryController,
                            hintText: 'Country',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus())
                      ])
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        kHeight10,
                        Text('Current Address *', style: textHeadStyle1),
                        kHeight40,
                        CustomTextField(
                            maxLines: 3,
                            validate: Validate.notNull,
                            inputType: TextInputType.streetAddress,
                            controller: formController.addressController,
                            hintText: 'Address',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight40,
                        Row(children: [
                          Expanded(
                            child: CustomTextField(
                                validate: Validate.notNull,
                                controller:
                                    formController.emiratesStatesController,
                                hintText: 'Emirates/States',
                                onTapOutside: () =>
                                    FocusScope.of(context).unfocus()),
                          ),
                          kWidth50,
                          Expanded(
                            child: CustomTextField(
                                validate: Validate.notNull,
                                controller: formController.countryController,
                                hintText: 'Country',
                                onTapOutside: () =>
                                    FocusScope.of(context).unfocus()),
                          )
                        ])
                      ])));
  }
}
