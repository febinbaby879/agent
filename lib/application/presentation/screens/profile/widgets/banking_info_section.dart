import 'package:agent_dashboard/application/controller/claims/claims_controller.dart';
import 'package:agent_dashboard/application/presentation/screens/profile/widgets/side_bar.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BankingInformation extends StatelessWidget {
  const BankingInformation({super.key, required this.isSmallScreen});

  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSmallScreen
          ? AppBar(
              title: const Text('Banking Information'),
              backgroundColor: kWhite,
              foregroundColor: Colors.black,
            )
          : null,
      drawer: isSmallScreen
          ? const Drawer(child: SidebarWidget(maxWidth: 280))
          : null,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 32),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            _addAccount(context);
          },
          child: Card(
            color: kWhite,
            child: ListTile(
              leading: Icon(Icons.account_balance, color: kpurple400),
              title: const Text('Bank Account Name'),
              subtitle: const Text('Bank Account Number'),
              trailing: const Icon(Icons.arrow_right),
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: kpurple400,
          foregroundColor: kWhite,
        ),
        onPressed: () {
          _addAccount(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Account'),
      ),
    );
  }

  void _addAccount(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return _bankingInfo(Get.find<ClaimsController>(), context);
      },
    );
  }

  Widget _bankingInfo(ClaimsController controller, BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final isMob = constrains.maxWidth < 500;
      return Card(
        color: kWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Form(
            key: controller.bankingDetailKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Bank Account Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      ],
                kHeight10,
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addBankAccount(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kpurple400,
                      foregroundColor: kWhite,
                    ),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
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
}
