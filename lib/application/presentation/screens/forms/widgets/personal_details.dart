import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/date_pick_container.dart';
import 'package:agent_dashboard/application/presentation/widgets/dropdown_builder.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;
    return Form(
        key: formController.personalFormKey,
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isMobile(context) ? 10 : 50),
            child: isWideScreen
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        kHeight10,
                        Text('Personal Details *', style: textHeadStyle1),
                        kHeight40,
                        Row(children: [
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.name,
                                  controller:
                                      formController.firstNameController,
                                  hintText: 'First Name',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus())),
                          kWidth50,
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.name,
                                  controller:
                                      formController.secondNameController,
                                  hintText: 'Second Name',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()))
                        ]),
                        kHeight40,
                        Row(children: [
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.email,
                                  inputType: TextInputType.emailAddress,
                                  controller:
                                      formController.personalemailController,
                                  hintText: 'Email',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus())),
                          kWidth50,
                          Expanded(
                              child: Row(children: [
                            Obx(() => SizedBox(
                                  width: 90,
                                  child: CustomDropDownBuilder(
                                      onChanged: (c0de) => formController
                                          .changeCoutryCode(code: c0de ?? ''),
                                      items: formController.countryCodes
                                          .map((code) => code.dialCode)
                                          .toList(),
                                      selectedvalue: formController
                                          .selectedCountryCode.value,
                                      hintText: ''),
                                )),
                            kWidth10,
                            Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.number,
                                  controller:
                                      formController.mobileNumberController,
                                  hintText: 'Mobile Number',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()),
                            )
                          ]))
                        ]),
                        kHeight40,
                        Row(children: [
                          Expanded(
                              child: DatePickerField(
                                  hintText: 'DOB',
                                  startYear: 200,
                                  endYear: 0,
                                  controller:
                                      formController.personalDOBController)),
                          kWidth50,
                          Obx(() => Expanded(
                              child: CustomDropDownBuilder(
                                  onChanged: (meritalStatus) =>
                                      formController.changeMeritalStatus(
                                          meritalStatus: meritalStatus ?? ''),
                                  items: formController.meritalStatus,
                                  hintText: 'Merital Status',
                                  selectedvalue: formController
                                      .selectedmeritalStatus.value))),
                          kHeight10
                        ]),
                        kHeight40,
                        Row(children: [
                          Obx(() => Expanded(
                              child: CustomDropDownBuilder(
                                  onChanged: (gender) => formController
                                      .changeGender(gender: gender ?? ''),
                                  items: formController.genders,
                                  selectedvalue:
                                      formController.selectedGender.value,
                                  hintText: 'Gender'))),
                          kWidth50,
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.number,
                                  controller:
                                      formController.nationalityController,
                                  hintText: 'Nationality',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()))
                        ]),
                        kHeight40,
                        Row(children: [
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.text,
                                  controller:
                                      formController.currentAddressController,
                                  hintText: 'Current Address',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus())),
                          kWidth50,
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.text,
                                  controller: formController
                                      .emiratesOrNationalIdController,
                                  hintText: 'Emirates / National ID Number',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus())),
                        ]),
                        kHeight40,
                        Row(children: [
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.number,
                                  controller:
                                      formController.passportNumberController,
                                  hintText: 'Passport Number',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus())),
                          kWidth50,
                          Expanded(
                              child: DatePickerField(
                                  hintText: 'Passport Issue date',
                                  startYear: 0,
                                  endYear: 100,
                                  controller: formController
                                      .passportDateOfIssueController))
                        ]),
                        kHeight40,
                        Row(children: [
                          Expanded(
                              child: DatePickerField(
                                  hintText: 'Passport expiry date',
                                  startYear: 0,
                                  endYear: 100,
                                  controller: formController
                                      .passportDateOfExpiryController)),
                          kWidth50,
                          Expanded(
                              child: CustomTextField(
                                  validate: Validate.notNull,
                                  inputType: TextInputType.text,
                                  controller: formController
                                      .passportIssueCountryController,
                                  hintText: 'Passport issuing Country',
                                  onTapOutside: () =>
                                      FocusScope.of(context).unfocus()))
                        ])
                      ])
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        kHeight10,
                        Text('Personal Details *', style: textHeadStyle1),
                        kHeight40,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.name,
                            controller: formController.firstNameController,
                            hintText: 'First Name',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.name,
                            controller: formController.secondNameController,
                            hintText: 'Second Name',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        Row(children: [
                          Obx(() => SizedBox(
                                width: 90,
                                child: CustomDropDownBuilder(
                                    onChanged: (c0de) => formController
                                        .changeCoutryCode(code: c0de ?? ''),
                                    items: formController.countryCodes
                                        .map((code) => code.dialCode)
                                        .toList(),
                                    selectedvalue: formController
                                        .selectedCountryCode.value,
                                    hintText: ''),
                              )),
                          kWidth10,
                          Expanded(
                            child: CustomTextField(
                                validate: Validate.notNull,
                                inputType: TextInputType.number,
                                controller:
                                    formController.mobileNumberController,
                                hintText: 'Mobile Number',
                                onTapOutside: () =>
                                    FocusScope.of(context).unfocus()),
                          )
                        ]),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.email,
                            inputType: TextInputType.emailAddress,
                            controller: formController.personalemailController,
                            hintText: 'Email',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        DatePickerField(
                            hintText: 'DOB',
                            startYear: 200,
                            endYear: 0,
                            controller: formController.personalDOBController),
                        kHeight10,
                        Obx(() => CustomDropDownBuilder(
                            onChanged: (meritalStatus) =>
                                formController.changeMeritalStatus(
                                    meritalStatus: meritalStatus ?? ''),
                            items: formController.meritalStatus,
                            hintText: 'Merital Status',
                            selectedvalue:
                                formController.selectedmeritalStatus.value)),
                        kHeight10,
                        Obx(() => CustomDropDownBuilder(
                            onChanged: (gender) => formController.changeGender(
                                gender: gender ?? ''),
                            items: formController.genders,
                            selectedvalue: formController.selectedGender.value,
                            hintText: 'Gender')),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.number,
                            controller: formController.nationalityController,
                            hintText: 'Nationality',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.text,
                            controller: formController.currentAddressController,
                            hintText: 'Current Address',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.text,
                            controller:
                                formController.emiratesOrNationalIdController,
                            hintText: 'Emirates / National ID Number',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.number,
                            controller: formController.passportNumberController,
                            hintText: 'Passport Number',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        DatePickerField(
                            hintText: 'Passport Issue date',
                            startYear: 0,
                            endYear: 100,
                            controller:
                                formController.passportDateOfIssueController),
                        kHeight10,
                        kHeight10,
                        DatePickerField(
                            hintText: 'Passport expiry date',
                            startYear: 0,
                            endYear: 100,
                            controller:
                                formController.passportDateOfExpiryController),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.text,
                            controller:
                                formController.passportIssueCountryController,
                            hintText: 'Passport issuing Country',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus())
                      ])));
  }
}
