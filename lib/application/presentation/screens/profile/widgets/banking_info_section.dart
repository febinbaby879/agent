import 'package:agent_dashboard/application/controller/claims/claims_controller.dart';
import 'package:agent_dashboard/application/controller/profile/profile_controller.dart';
import 'package:agent_dashboard/application/presentation/screens/profile/widgets/side_bar.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/widgets/dropdown_builder.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BankingInformation extends StatelessWidget {
  const BankingInformation({super.key, required this.isSmallScreen});

  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banking Information'),
        backgroundColor: kWhite,
        foregroundColor: Colors.black,
      ),
      drawer: isSmallScreen
          ? const Drawer(child: SidebarWidget(maxWidth: 280))
          : null,
      body: Obx(
        () {
          if (controller.bankingInfoLoading.value) {
            return Center(
              child: CupertinoActivityIndicator(
                color: kpurple400,
              ),
            );
          }
          if (controller
                  .profileInfo.value.bankDetails?.allBankAccounts?.isEmpty ??
              false) {
            return const Center(
              child: Text('No accounts available'),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 32),
            itemCount: controller
                    .profileInfo.value.bankDetails?.allBankAccounts?.length ??
                0,
            itemBuilder: (context, index) {
              final info = controller
                  .profileInfo.value.bankDetails!.allBankAccounts![index];
              return GestureDetector(
                onTap: () {
                  _addAccount(context, false);
                  controller.selectBankAccountInfo(info);
                },
                child: Card(
                  color: kWhite,
                  child: ListTile(
                      leading: Icon(Icons.account_balance, color: kpurple400),
                      title: Text(info.accountNumber ?? ""),
                      subtitle: Text(info.bankName ?? ""),
                      trailing: (info.isDefault ?? false)
                          ? Icon(
                              Icons.check_circle,
                              color: kpurple400,
                            )
                          : const Icon(
                              Icons.arrow_forward_ios,
                              size: 10,
                            )),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: kpurple400,
          foregroundColor: kWhite,
        ),
        onPressed: () {
          _addAccount(context, true);
          controller.clearBankingControllers();
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Account'),
      ),
    );
  }

  void _addAccount(BuildContext context, bool add) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return _bankingInfo(Get.find<ClaimsController>(), context, add: add);
      },
    );
  }

  Widget _bankingInfo(ClaimsController controller, BuildContext context,
      {bool add = true}) {
    final profileController = Get.find<ProfileController>();
    return LayoutBuilder(builder: (context, constrains) {
      final isMob = constrains.maxWidth < 500;
      return Card(
        color: kWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Form(
            key: profileController.bankingDetailKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Bank Account Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  kHeight10,
                  ...isMob
                      ? [
                          _bankAccountType(profileController),
                          kHeight10,
                          _bankAccountIsDefault(profileController),
                          kHeight10,
                          _bankAccountName(profileController),
                          kHeight10,
                          _bankIbanNumber(profileController),
                          kHeight10,
                          _bankName(profileController),
                          kHeight10,
                          _bankAccNumber(profileController),
                          kHeight10,
                          _bankAdderss(profileController),
                          kHeight10,
                          _bankSwiftCode(profileController),
                          kHeight10,
                        ]
                      : [
                          Row(
                            children: [
                              Expanded(
                                child: _bankAccountType(profileController),
                              ),
                              kWidth20,
                              Expanded(
                                child: _bankAccountIsDefault(profileController),
                              ),
                            ],
                          ),
                          kHeight10,
                          Row(
                            children: [
                              Expanded(
                                  child: _bankAccountName(profileController)),
                              kWidth20,
                              Expanded(
                                  child: _bankIbanNumber(profileController)),
                            ],
                          ),
                          kHeight10,
                          Row(
                            children: [
                              Expanded(child: _bankName(profileController)),
                              kWidth20,
                              Expanded(
                                  child: _bankAccNumber(profileController)),
                            ],
                          ),
                          kHeight10,
                          Row(
                            children: [
                              Expanded(child: _bankAdderss(profileController)),
                              kWidth20,
                              Expanded(
                                  child: _bankSwiftCode(profileController)),
                            ],
                          ),
                          kHeight10,
                        ],
                  kHeight10,
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (!add)
                            ElevatedButton(
                              onPressed: () async {
                                bool success =
                                    await profileController.deleteBankAccount(
                                        id: profileController
                                                .selectedBankingInfo.value.id ??
                                            '');

                                if (success) {
                                  GoRouter.of(context).pop();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kRed,
                                foregroundColor: kWhite,
                              ),
                              child: profileController
                                      .bankingInfoDeleteLoading.value
                                  ? const CupertinoActivityIndicator(
                                      color: kWhite,
                                    )
                                  : const Text('Detete'),
                            ),
                          kWidth20,
                          ElevatedButton(
                            onPressed: () async {
                              bool success;
                              if (add) {
                                success =
                                    await profileController.addBankAccount();
                              } else {
                                success =
                                    await profileController.updateBankAccount();
                              }
                              if (success) {
                                GoRouter.of(context).pop();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kpurple400,
                              foregroundColor: kWhite,
                            ),
                            child: profileController.bankingInfoLoading.value
                                ? const CupertinoActivityIndicator(
                                    color: kWhite,
                                  )
                                : const Text('Save'),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Row _bankAccountIsDefault(ProfileController profileController) {
    return Row(
      children: [
        const Text('Is Default'),
        Obx(
          () => Switch(
              value: profileController.isDefaultBanking.value,
              onChanged: (value) {
                profileController.isDefalutBankingData(value);
              }),
        ),
      ],
    );
  }

  Obx _bankAccountType(ProfileController profileController) {
    return Obx(
      () => CustomDropDownBuilder(
          onChanged: (value) {
            profileController.chooseAccountType(value);
          },
          selectedvalue: profileController.bankAccountType.value,
          hintText: 'Account Type',
          items: bankingAccountTypes),
    );
  }

  CustomTextField _bankSwiftCode(ProfileController controller) {
    return CustomTextField(
        hintText: 'Swift Code',
        controller: controller.bankSwiftCode,
        validate: Validate.none);
  }

  CustomTextField _bankAdderss(ProfileController controller) {
    return CustomTextField(
        hintText: 'Bank Address',
        controller: controller.bankAddress,
        validate: Validate.none);
  }

  CustomTextField _bankAccNumber(ProfileController controller) {
    return CustomTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: 'Account Number',
        controller: controller.bankAccountNumber,
        validate: Validate.bankAccountNumber);
  }

  CustomTextField _bankName(ProfileController controller) {
    return CustomTextField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        hintText: 'Bank Name',
        controller: controller.bankName,
        validate: Validate.notNull);
  }

  CustomTextField _bankIbanNumber(ProfileController controller) {
    return CustomTextField(
        hintText: 'IBAN Number',
        controller: controller.bankIBAN,
        validate: Validate.none);
  }

  CustomTextField _bankAccountName(ProfileController controller) {
    return CustomTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hintText: 'Account Name',
      controller: controller.bankAccountHolderName,
      validate: Validate.notNull,
    );
  }
}
