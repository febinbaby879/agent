import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferredBy extends StatelessWidget {
  const ReferredBy({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;

    return Form(
      key: formController.referredByFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 10 : 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight10,
            Text('How did you know about us - Referred by',
                style: textHeadStyle1),
            kHeight40,
            if (!isWideScreen) ...[
              CustomTextField(
                validate: Validate.notNull,
                controller: formController.referredNameController,
                hintText: 'Name',
                onChanged: (val) => formController.referredNameController.text =
                    val.toLowerCase(),
                onTapOutside: () => FocusScope.of(context).unfocus(),
              ),
              kHeight10,
              CustomTextField(
                validate: Validate.notNull,
                inputType: TextInputType.phone,
                controller: formController.referredMobileController,
                hintText: 'Mobile Number',
                onTapOutside: () => FocusScope.of(context).unfocus(),
              ),
              kHeight10,
              CustomTextField(
                validate: Validate.email,
                controller: formController.referredEmailController,
                hintText: 'Email ID',
                onTapOutside: () => FocusScope.of(context).unfocus(),
              ),
              kHeight10,
              CustomTextField(
                validate: Validate.notNull,
                controller: formController.referredCountryController,
                hintText: 'Country',
                onTapOutside: () => FocusScope.of(context).unfocus(),
              ),
            ] else
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          validate: Validate.notNull,
                          controller: formController.referredNameController,
                          hintText: 'Name',
                          onChanged: (val) => formController
                              .referredNameController.text = val.toLowerCase(),
                          onTapOutside: () => FocusScope.of(context).unfocus(),
                        ),
                      ),
                      kWidth50,
                      Expanded(
                        child: CustomTextField(
                          validate: Validate.notNull,
                          inputType: TextInputType.phone,
                          controller: formController.referredMobileController,
                          hintText: 'Mobile Number',
                          onTapOutside: () => FocusScope.of(context).unfocus(),
                        ),
                      ),
                    ],
                  ),
                  kHeight10,
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          validate: Validate.email,
                          controller: formController.referredEmailController,
                          hintText: 'Email ID',
                          onTapOutside: () => FocusScope.of(context).unfocus(),
                        ),
                      ),
                      kWidth50,
                      Expanded(
                        child: CustomTextField(
                          validate: Validate.notNull,
                          controller: formController.referredCountryController,
                          hintText: 'Country',
                          onTapOutside: () => FocusScope.of(context).unfocus(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
