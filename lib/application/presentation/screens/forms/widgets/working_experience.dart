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
          ? Obx(() => Column(children: [
                ...List.generate(formController.workExperiences.length,
                    (index) {
                  final exp = formController.workExperiences[index];
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kHeight10,
                        Text('Work Experience (for working students)',
                            style: textHeadStyle1),
                        kHeight40,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.number,
                            controller: exp.companyNameController,
                            hintText: 'Company Name',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.text,
                            controller: exp.positionController,
                            hintText: 'Position',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                          validate: Validate.notNull,
                          inputType: TextInputType.text,
                          controller: exp.yearOfServiceController,
                          hintText: 'Year of Service',
                          onTapOutside: () => FocusScope.of(context).unfocus(),
                        ),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.streetAddress,
                            controller: exp.companyAddressController,
                            hintText: 'Company Address',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        CustomTextField(
                            validate: Validate.notNull,
                            inputType: TextInputType.number,
                            controller: exp.companyContactNumberController,
                            hintText: 'Company Contact Number',
                            onTapOutside: () =>
                                FocusScope.of(context).unfocus()),
                        kHeight10,
                        // FilePickContainer(
                        //     isloading:
                        //         formController.pickexperieceCertificateloading.value,
                        //     needMoreFiles:
                        //         (formController.experienceCertificate.length == 1)
                        //             ? false
                        //             : false,
                        //     text: 'Upload Work Experience Letter (if any)',
                        //     selectedFiles: formController.experienceCertificate,
                        //     onTap: () => formController.pickexperieceCertificate(),
                        //     onRemove: (image) =>
                        //         formController.removeexperieceCertificate(image))
                        Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    formController.removeWorkExperience(index)))
                      ]);
                }),
                Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () => formController.addWorkExperience(),
                        child: const Text('Add Another Experience')))
              ]))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight10,
                Text('Work Experience (for working students)',
                    style: textHeadStyle1),
                kHeight40,
                Obx(() => Column(
                        children: List.generate(
                            formController.workExperiences.length, (index) {
                      final exp = formController.workExperiences[index];
                      return Column(children: [
                        Row(children: [
                          Expanded(
                            child: CustomTextField(
                              validate: Validate.notNull,
                              inputType: TextInputType.text,
                              controller: exp.companyNameController,
                              hintText: 'Company Name',
                              onTapOutside: () =>
                                  FocusScope.of(context).unfocus(),
                            ),
                          ),
                          kWidth50,
                          Expanded(
                            child: CustomTextField(
                              validate: Validate.notNull,
                              inputType: TextInputType.text,
                              controller: exp.positionController,
                              hintText: 'Position',
                              onTapOutside: () =>
                                  FocusScope.of(context).unfocus(),
                            ),
                          ),
                        ]),
                        kHeight40,
                        Row(children: [
                          Expanded(
                            child: CustomTextField(
                              validate: Validate.notNull,
                              inputType: TextInputType.text,
                              controller: exp.yearOfServiceController,
                              hintText: 'Year of Service',
                              onTapOutside: () =>
                                  FocusScope.of(context).unfocus(),
                            ),
                          ),
                          kWidth50,
                          Expanded(
                            child: CustomTextField(
                              validate: Validate.notNull,
                              inputType: TextInputType.streetAddress,
                              controller: exp.companyAddressController,
                              hintText: 'Company Address',
                              onTapOutside: () =>
                                  FocusScope.of(context).unfocus(),
                            ),
                          ),
                        ]),
                        kHeight40,
                        CustomTextField(
                          validate: Validate.notNull,
                          inputType: TextInputType.number,
                          controller: exp.companyContactNumberController,
                          hintText: 'Company Contact Number',
                          onTapOutside: () => FocusScope.of(context).unfocus(),
                        ),
                        kHeight40,
                        // FilePickContainer(
                        //   isloading: false,
                        //   needMoreFiles: false,
                        //   text: 'Upload Work Experience Letter',
                        //   selectedFiles: const [], // optional: show picked files if needed
                        //   onTap: () async {
                        //     final uploadedUrl = formController
                        //         .pickexperieceCertificate();
                        //     exp.uploadedCertificateUrl.value = uploadedUrl;
                        //   },
                        //   onRemove: (_) =>
                        //       exp.uploadedCertificateUrl.value = '',
                        // ),
                        kHeight10,
                        Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => formController
                                    .removeWorkExperience(index))),
                        kHeight20
                      ]);
                    }))),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () => formController.addWorkExperience(),
                      child: const Text('Add Another Experience')),
                )
              ],
            ),
    );
  }
}
