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
              const Row(
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: 'Name',
                controller: controller.nameSignupController,
                validate: Validate.none,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: 'Email',
                controller: controller.emailSignupController,
                validate: Validate.email,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    'Phone',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: 'Phone',
                controller: controller.phoneSignupController,
                validate: Validate.phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    'Agency Name',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: 'Agency Name',
                controller: controller.agencyNameSignupController,
                validate: Validate.notNull,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    'Directors Name',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: 'Directors Name',
                controller: controller.directorsNameSignupController,
                validate: Validate.notNull,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    'Directors Phone',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: 'Directors Phone',
                controller: controller.directorsPhoneSignupController,
                validate: Validate.phone,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              CustomTextField(
                maxLines: 3,
                hintText: 'Address',
                controller: controller.addressSignupController,
                validate: Validate.notNull,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 8),
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
              // CustomTextField(
              //   hintText: 'Country',
              //   controller: controller.countrySignupController,
              //   validate: Validate.notNull,
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              // ),
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
