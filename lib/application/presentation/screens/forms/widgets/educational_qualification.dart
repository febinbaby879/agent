import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/file_pick_container.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/date_pick_container.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationalQualifications extends StatelessWidget {
  const EducationalQualifications({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    final bool isWideScreen = MediaQuery.of(context).size.width > 1000;
    return Form(
        key: formController.educationalQualificationFormKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 10 : 50),
          child: isWideScreen
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  kHeight10,
                  Text('Educational Qualifications *', style: textHeadStyle1),
                  kHeight40,
                  Row(children: [
                    Expanded(
                        child: CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.name,
                            controller:
                                formController.latestQulificationController,
                            hintText: 'HIghest Qualification',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus())),
                    kWidth50,
                    Expanded(
                        child: CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.name,
                            controller: formController
                                .institutionSchoolUniversityController,
                            hintText: 'Enter Institution/School/University',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()))
                  ]),
                  kHeight40,
                  Row(children: [
                    Expanded(
                        child: DatePickerField(
                            hintText: 'Start Date',
                            startYear: 20,
                            endYear: 0,
                            controller: formController.startDateController)),
                    kWidth50,
                    Expanded(
                        child: DatePickerField(
                            hintText: 'End Date',
                            startYear: 0,
                            endYear: 20,
                            controller: formController.endDateController))
                  ]),
                  kHeight40,
                  Row(children: [
                    Expanded(
                        child: CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.name,
                            controller: formController.gradePointController,
                            hintText: 'Grade / Percentage / GPA *',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus())),
                    kWidth50,
                    GetBuilder<ApplicationController>(
                        builder: (controller) => Expanded(
                            child: FilePickContainer(
                                isloading: controller
                                    .additionalCertificateloading.value,
                                selectedFiles: formController
                                    .highestQualificationCertificate,
                                onTap: () =>
                                    formController.pickadditionalCertificate(),
                                onRemove: (image) => formController
                                    .removeAdditionalCertificate(image),
                                needMoreFiles: (formController
                                            .additionalCertificate.length ==
                                        1)
                                    ? false
                                    : false,
                                text: 'Additional Certification')))
                  ])
                ])
              : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  kHeight10,
                  Text('Educational Qualifications *', style: textHeadStyle1),
                  kHeight40,
                  CustomTextField(
                      validate: Validate.notNull,
                      inputType: TextInputType.name,
                      controller: formController.latestQulificationController,
                      hintText: 'Highest Qualification',
                      onTapOutside: () => FocusScope.of(context).unfocus()),
                  kHeight10,
                  CustomTextField(
                      validate: Validate.notNull,
                      inputType: TextInputType.name,
                      controller:
                          formController.institutionSchoolUniversityController,
                      hintText: 'Enter Institution/School/University',
                      onTapOutside: () => FocusScope.of(context).unfocus()),
                  kHeight10,
                  DatePickerField(
                      hintText: 'Start Date',
                      startYear: 200,
                      endYear: 0,
                      controller: formController.startDateController),
                  kHeight10,
                  DatePickerField(
                      hintText: 'End Date',
                      startYear: 200,
                      endYear: 0,
                      controller: formController.endDateController),
                  kHeight10,
                  CustomTextField(
                      validate: Validate.notNull,
                      inputType: TextInputType.name,
                      controller: formController.gradePointController,
                      hintText: 'Grade / Percentage / GPA *',
                      onTapOutside: () => FocusScope.of(context).unfocus()),
                  kHeight10,
                  GetBuilder<ApplicationController>(
                      builder: (controller) => FilePickContainer(
                          isloading:
                              controller.additionalCertificateloading.value,
                          selectedFiles:
                              formController.highestQualificationCertificate,
                          onTap: () =>
                              formController.pickadditionalCertificate(),
                          onRemove: (image) =>
                              formController.removeAdditionalCertificate(image),
                          needMoreFiles:
                              (formController.additionalCertificate.length == 1)
                                  ? false
                                  : false,
                          text: 'Additional Certification'))
                ]),
        ));
  }
}
