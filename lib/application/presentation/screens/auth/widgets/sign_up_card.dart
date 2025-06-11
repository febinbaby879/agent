import 'package:agent_dashboard/application/controller/auth/auth_controller.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/widgets/dropdown_search.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUPCard extends StatelessWidget {
  const SignUPCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Form(
          key: controller.signUpKey,
          child: Column(
            children: [
              const Text(
                'Welcome to EduGuardian Agent Portal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A4A),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Create Your Agent Account Now',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 30),
              _TextField(
                hintText: 'Name',
                controller: controller.nameSignupController,
                validate: Validate.none,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              _TextField(
                hintText: 'Email',
                controller: controller.emailSignupController,
                validate: Validate.email,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              _TextField(
                hintText: 'Phone',
                controller: controller.phoneSignupController,
                validate: Validate.phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const Row(
                children: [
                  Text(
                    'Country',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              SearchableDropdown(
                borderColor: kRed,
                controller: controller.countrySignupController,
                items: countryList,
                onChanged: (value) {},
                hintText: 'Country',
              ),
              const Row(
                children: [
                  Text(
                    'Company Type',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              SearchableDropdown(
                borderColor: kRed,
                controller: controller.companyTypeSignupController,
                items: companyTypes,
                onChanged: (value) {},
                hintText: 'Company Type',
              ),
              _TextField(
                maxLines: 1,
                hintText: 'Password',
                controller: controller.passwordSignupController,
                validate: Validate.password,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 15),

              // Sign up button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // controller.showOtpCard(true);
                      controller.registerAgent();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPurple,
                      foregroundColor: kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: controller.registerLoading.value
                        ? const CircularProgressIndicator(
                            color: kWhite,
                          )
                        : const Text(
                            'Verify',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    this.controller,
    this.validate = Validate.none,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.hintText = '',
    this.maxLines = 1,
  });

  final String hintText;
  final TextEditingController? controller;
  final Validate validate;
  final AutovalidateMode autovalidateMode;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              hintText,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        CustomTextField(
          maxLines: maxLines,
          hintText: hintText,
          controller: controller,
          validate: validate,
          autovalidateMode: autovalidateMode,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
