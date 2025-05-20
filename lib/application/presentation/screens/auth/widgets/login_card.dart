import 'package:agent_dashboard/application/controller/auth/auth.dart';
import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/enum/enum.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Form(
          key: controller.loginKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                'Please sign-in to your account',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 40),

              // Email/Username field
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
                controller: controller.emailController,
                validate: Validate.email,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 10),

              // Password field
              const Row(
                children: [
                  Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              CustomTextField(
                hintText: 'Password',
                controller: controller.passwordController,
                validate: Validate.notNull,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true,
              ),
              const SizedBox(height: 15),

              // Remember me and Forgot Password
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              // TextButton(
              //   onPressed: () {},
              //   child: const Text(
              //     'Forgot Password?',
              //     style: TextStyle(
              //       color: Colors.blue,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),

              //   ],
              // ),
              // const SizedBox(height: 10),

              // Sign In button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(Routes.homeScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPurple,
                      foregroundColor: kWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: controller.loginLoading.value
                        ? const CircularProgressIndicator(
                            color: kWhite,
                          )
                        : const Text(
                            'Sign In',
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
