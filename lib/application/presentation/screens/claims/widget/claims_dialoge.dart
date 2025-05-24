import 'package:agent_dashboard/application/controller/claims/claims_controller.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClaimDialogeWidget extends StatelessWidget {
  const ClaimDialogeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClaimsController>();
    return Dialog(
      shape: ContinuousRectangleBorder(borderRadius: kRadius10),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Form(
            key: controller.claimFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: Text('Claim Form',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
                // kHeight20,
                // const Text(
                //   'Apply for a claim. \nWe will initiate the payment after your claim request is approved.\nThe amount will be credited to your bank account.',
                //   style: TextStyle(),
                // ),
                kHeight15,
                _agentDetails(controller),
                kHeight15,
                _studentSection(controller, context),
                kHeight15,
                _totalClaimsSection(controller),
                kHeight15,
                _bankingInfo(controller),
                kHeight10,
                _declarationCheckBox(controller),
                kHeight10,
                Align(
                  alignment: Alignment.centerRight,
                  child: Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kpurple400, foregroundColor: kWhite),
                      onPressed: () {
                        controller.applyClaim();
                      },
                      child: controller.applyClaimLoading.value
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ShakeX(
                                    infinite: true,
                                    child: const Icon(Icons.send)),
                                const Text('  Submitting... ')
                              ],
                            )
                          : const Text(' SUBMIT CLAIM '),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _declarationCheckBox(ClaimsController controller) {
    return Obx(
      () => Card(
        color:
            controller.agreeTermsError.value ? kRed.withOpacity(0.2) : kWhite,
        elevation: controller.agreeTermsError.value ? 0 : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              Checkbox(
                  isError: controller.agreeTermsError.value,
                  value: controller.agreeTerms.value,
                  onChanged: (value) {
                    controller.changeTerms(value ?? false);
                  }),
              kWidth10,
              Text(
                'I hereby declare that all the provided details are correct and accurate. *',
                style: TextStyle(
                    color: controller.agreeTermsError.value ? kRed : null),
              )
            ],
          ),
        ),
      ),
    );
  }

  Align _totalClaimsSection(ClaimsController controller) {
    return Align(
      alignment: Alignment.centerRight,
      child: Obx(() => Text.rich(
            TextSpan(
              text: 'Total Claim Amount ',
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: '\$${controller.totalClaims.value}',
                  style: TextStyle(
                    fontSize: 18,
                    color: kpurple400,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: '  ',
                ),
              ],
            ),
          )),
    );
  }

  Widget _studentSection(ClaimsController controller, BuildContext context) {
    return Card(
      color: kWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Student Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kpurple400, foregroundColor: kWhite),
                    onPressed: () {
                      controller.addStudent();
                    },
                    label: const Icon(Icons.add),
                    icon: const Text('Add Student'),
                  )
                ],
              ),
              kHeight10,
              ...List.generate(controller.studentCountClaims.value, (index) {
                return Column(
                  children: [
                    if (index != 0) const Divider(),
                    Row(
                      children: [
                        Text('${index + 1},',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        kWidth5,
                        Expanded(
                            child: CustomTextField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          hintText: 'Student Name',
                          controller: controller.studentName[index],
                          validate: Validate.notNull,
                        )),
                        kWidth20,
                        Expanded(
                            child: CustomTextField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintText: 'Registration Number',
                                controller: controller.studentRegNumber[index],
                                validate: Validate.notNull)),
                        kWidth20,
                        Expanded(
                            child: CustomTextField(
                                hintText: 'Intake',
                                controller: controller.studentIntake[index],
                                validate: Validate.none)),
                      ],
                    ),
                    kHeight10,
                    Row(
                      children: [
                        kWidth10,
                        Expanded(
                            child: CustomTextField(
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      final date = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(0),
                                        lastDate: DateTime.now().add(
                                          const Duration(days: 365 * 100),
                                        ),
                                      );
                                      if (date != null) {
                                        controller
                                                .studentTravelDate[index].text =
                                            "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
                                      }
                                    },
                                    icon: const Icon(Icons.calendar_month)),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintText: 'dd-mm-yyyy',
                                lebelText: 'Travel Date',
                                controller: controller.studentTravelDate[index],
                                validate: Validate.ifValidDate)),
                        kWidth20,
                        Expanded(
                            child: CustomTextField(
                                onChanged: (_) {
                                  controller.calculateTotalclaims();
                                },
                                inputType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                hintText: 'Claim Amount',
                                controller:
                                    controller.studentClaimAmount[index],
                                validate: Validate.notNull)),
                        if (controller.studentCountClaims.value != 1) kWidth20,
                        if (controller.studentCountClaims.value != 1)
                          IconButton(
                              onPressed: () {
                                controller.removeStudent(index);
                              },
                              icon: const Icon(Icons.delete))
                      ],
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget _agentDetails(ClaimsController controller) {
    return Card(
      color: kWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Agent Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            kHeight10,
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  hintText: 'Agency Name',
                  controller: controller.agencyName,
                  validate: Validate.notNull,
                )),
                kWidth20,
                Expanded(
                    child: CustomTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: 'Agent Name',
                        controller: controller.agentName,
                        validate: Validate.notNull)),
              ],
            ),
            kHeight10,
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: 'Contact Number',
                        controller: controller.agentContactNumber,
                        validate: Validate.phone)),
                kWidth20,
                Expanded(
                    child: CustomTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: 'Email',
                        controller: controller.agentEmail,
                        validate: Validate.email)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bankingInfo(ClaimsController controller) {
    return Card(
      color: kWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bank Account Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            kHeight10,
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  hintText: 'Account Name',
                  controller: controller.agentAccountName,
                  validate: Validate.notNull,
                )),
                kWidth20,
                Expanded(
                    child: CustomTextField(
                        hintText: 'IBAN Number',
                        controller: controller.agentIbanNumber,
                        validate: Validate.none)),
              ],
            ),
            kHeight10,
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: 'Bank Name',
                        controller: controller.agentBankName,
                        validate: Validate.notNull)),
                kWidth20,
                Expanded(
                    child: CustomTextField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        hintText: 'Account Number',
                        controller: controller.agentBankAccountNumber,
                        validate: Validate.bankAccountNumber)),
              ],
            ),
            kHeight10,
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                        hintText: 'Bank Address',
                        controller: controller.agentBankAddress,
                        validate: Validate.none)),
                kWidth20,
                Expanded(
                    child: CustomTextField(
                        hintText: 'Swift Code',
                        controller: controller.agentBankSwiftCode,
                        validate: Validate.none)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
