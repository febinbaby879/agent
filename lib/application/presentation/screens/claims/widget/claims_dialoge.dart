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
                _agentDetails(controller, context),
                kHeight15,
                _studentSection(controller, context),
                kHeight15,
                _totalClaimsSection(controller, context),
                kHeight15,
                _bankingInfo(controller, context),
                kHeight10,
                _declarationCheckBox(controller, context),
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

  Widget _declarationCheckBox(
      ClaimsController controller, BuildContext context) {
    return Obx(
      () => Card(
        color:
            controller.agreeTermsError.value ? kRed.withOpacity(0.2) : kWhite,
        elevation: controller.agreeTermsError.value ? 0 : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                  isError: controller.agreeTermsError.value,
                  value: controller.agreeTerms.value,
                  onChanged: (value) {
                    controller.changeTerms(value ?? false);
                  }),
              kWidth10,
              Expanded(
                child: Text(
                  'I hereby declare that all the provided details are correct and accurate. *',
                  style: TextStyle(
                      color: controller.agreeTermsError.value ? kRed : null),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Align _totalClaimsSection(ClaimsController controller, BuildContext context) {
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
    return LayoutBuilder(builder: (context, constrains) {
      bool isMob = constrains.maxWidth < 500;
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kpurple400, foregroundColor: kWhite),
                      onPressed: () {
                        controller.addStudent();
                      },
                      label: const Icon(Icons.add),
                      icon: Text(isMob ? '' : 'Add Student'),
                    )
                  ],
                ),
                kHeight10,
                ...List.generate(controller.studentCountClaims.value, (index) {
                  if (isMob) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${index + 1},',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            controller.studentCountClaims.value == 1
                                ? kEmpty
                                : _studentRemoveButton(controller, index)
                          ],
                        ),
                        kHeight10,
                        _studentName(controller, index),
                        kHeight10,
                        _studentRegNumber(controller, index),
                        kHeight10,
                        _studentIntake(controller, index),
                        kHeight10,
                        _studentTravelDate(context, controller, index),
                        kHeight10,
                        _studentClaimAmount(controller, index),
                        kHeight10,
                      ],
                    );
                  }
                  return Column(
                    children: [
                      if (index != 0) const Divider(),
                      Row(
                        children: [
                          Text('${index + 1},',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          kWidth5,
                          Expanded(child: _studentName(controller, index)),
                          kWidth20,
                          Expanded(child: _studentRegNumber(controller, index)),
                          kWidth20,
                          Expanded(child: _studentIntake(controller, index)),
                        ],
                      ),
                      kHeight10,
                      Row(
                        children: [
                          kWidth10,
                          Expanded(
                              child: _studentTravelDate(
                                  context, controller, index)),
                          kWidth20,
                          Expanded(
                              child: _studentClaimAmount(controller, index)),
                          if (controller.studentCountClaims.value != 1)
                            kWidth20,
                          if (controller.studentCountClaims.value != 1)
                            _studentRemoveButton(controller, index)
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
    });
  }

  Widget _agentDetails(ClaimsController controller, BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      bool isMob = constrains.maxWidth < 500;
      return Card(
        color: kWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Agent Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            kHeight10,
            ...isMob
                ? [
                    _agencyName(controller),
                    kHeight10,
                    _agentName(controller),
                    kHeight10,
                    _agentContactNumer(controller),
                    kHeight10,
                    _agentEmail(controller),
                    kHeight10,
                  ]
                : [
                    Row(
                      children: [
                        Expanded(child: _agencyName(controller)),
                        kWidth20,
                        Expanded(child: _agentName(controller)),
                      ],
                    ),
                    kHeight10,
                    Row(
                      children: [
                        Expanded(child: _agentContactNumer(controller)),
                        kWidth20,
                        Expanded(child: _agentEmail(controller)),
                      ],
                    ),
                  ],
          ]),
        ),
      );
    });
  }

  Widget _bankingInfo(ClaimsController controller, BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final isMob = constrains.maxWidth < 500;
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
              ...isMob
                  ? [
                      _bankAccountNumber(controller),
                      kHeight10,
                      bankIbanNumber(controller),
                      kHeight10,
                      bankName(controller),
                      kHeight10,
                      bankIbanNumber(controller),
                      kHeight10,
                      _bankAdderss(controller),
                      kHeight10,
                      _bankSwiftCode(controller),
                      kHeight10,
                    ]
                  : [
                      Row(
                        children: [
                          Expanded(child: _bankAccountNumber(controller)),
                          kWidth20,
                          Expanded(child: bankIbanNumber(controller)),
                        ],
                      ),
                      kHeight10,
                      Row(
                        children: [
                          Expanded(child: bankName(controller)),
                          kWidth20,
                          Expanded(child: _bankAccNumber(controller)),
                        ],
                      ),
                      kHeight10,
                      Row(
                        children: [
                          Expanded(child: _bankAdderss(controller)),
                          kWidth20,
                          Expanded(child: _bankSwiftCode(controller)),
                        ],
                      ),
                    ]
            ],
          ),
        ),
      );
    });
  }

  IconButton _studentRemoveButton(ClaimsController controller, int index) {
    return IconButton(
        onPressed: () {
          controller.removeStudent(index);
        },
        icon: const Icon(Icons.delete));
  }

  CustomTextField _studentClaimAmount(ClaimsController controller, int index) {
    return CustomTextField(
        onChanged: (_) {
          controller.calculateTotalclaims();
        },
        inputType: TextInputType.number,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: 'Claim Amount',
        controller: controller.studentClaimAmount[index],
        validate: Validate.notNull);
  }

  CustomTextField _studentTravelDate(
      BuildContext context, ClaimsController controller, int index) {
    return CustomTextField(
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
                controller.studentTravelDate[index].text =
                    "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
              }
            },
            icon: const Icon(Icons.calendar_month)),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: 'dd-mm-yyyy',
        lebelText: 'Travel Date',
        controller: controller.studentTravelDate[index],
        validate: Validate.ifValidDate);
  }

  CustomTextField _studentIntake(ClaimsController controller, int index) {
    return CustomTextField(
        hintText: 'Intake',
        controller: controller.studentIntake[index],
        validate: Validate.none);
  }

  CustomTextField _studentRegNumber(ClaimsController controller, int index) {
    return CustomTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: 'Registration Number',
        controller: controller.studentRegNumber[index],
        validate: Validate.notNull);
  }

  CustomTextField _studentName(ClaimsController controller, int index) {
    return CustomTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hintText: 'Student Name',
      controller: controller.studentName[index],
      validate: Validate.notNull,
    );
  }

  CustomTextField _bankSwiftCode(ClaimsController controller) {
    return CustomTextField(
        hintText: 'Swift Code',
        controller: controller.agentBankSwiftCode,
        validate: Validate.none);
  }

  CustomTextField _bankAdderss(ClaimsController controller) {
    return CustomTextField(
        hintText: 'Bank Address',
        controller: controller.agentBankAddress,
        validate: Validate.none);
  }

  CustomTextField _bankAccNumber(ClaimsController controller) {
    return CustomTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: 'Account Number',
        controller: controller.agentBankAccountNumber,
        validate: Validate.bankAccountNumber);
  }

  CustomTextField bankName(ClaimsController controller) {
    return CustomTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: 'Bank Name',
        controller: controller.agentBankName,
        validate: Validate.notNull);
  }

  CustomTextField bankIbanNumber(ClaimsController controller) {
    return CustomTextField(
        hintText: 'IBAN Number',
        controller: controller.agentIbanNumber,
        validate: Validate.none);
  }

  CustomTextField _bankAccountNumber(ClaimsController controller) {
    return CustomTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hintText: 'Account Name',
      controller: controller.agentAccountName,
      validate: Validate.notNull,
    );
  }

  CustomTextField _agentEmail(ClaimsController controller) {
    return CustomTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: 'Email',
        controller: controller.agentEmail,
        validate: Validate.email);
  }

  CustomTextField _agentContactNumer(ClaimsController controller) {
    return CustomTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: 'Contact Number',
        controller: controller.agentContactNumber,
        validate: Validate.phone);
  }

  CustomTextField _agentName(ClaimsController controller) {
    return CustomTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: 'Agent Name',
        controller: controller.agentName,
        validate: Validate.notNull);
  }

  CustomTextField _agencyName(ClaimsController controller) {
    return CustomTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hintText: 'Agency Name',
      controller: controller.agencyName,
      validate: Validate.notNull,
    );
  }
}
