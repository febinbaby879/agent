import 'package:agent_dashboard/application/controller/auth/auth.dart';
import 'package:agent_dashboard/application/presentation/screens/auth/widgets/login_card.dart';
import 'package:agent_dashboard/application/presentation/screens/auth/widgets/otp_card.dart';
import 'package:agent_dashboard/application/presentation/screens/auth/widgets/sign_up_card.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine if we're on mobile or desktop based on width
          final isMobile = constraints.maxWidth < 768;

          return Row(
            children: [
              // Left side with illustration
              if (!isMobile)
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Image.asset(
                          eduGuardianLogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),

              // Right side with login form
              Expanded(
                flex: isMobile ? 1 : 6,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 40,
                    vertical: 30,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo at the top for mobile view
                        if (isMobile)
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              eduGuardianLogo,
                              height: 160,
                              fit: BoxFit.contain,
                            ),
                          ),
                        if (isMobile) const SizedBox(height: 20),
                        // Tab buttons
                        const _TabButtons(),
                        kHeight10,
                        Obx(
                          () {
                            if (controller.showOtp.value) {
                              return const OtpCard();
                            }
                            if (controller.showLogin.value) {
                              return const LoginCard();
                            }
                            return const SignUPCard();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TabButtons extends StatelessWidget {
  const _TabButtons();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                controller.showLoginCard(true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.showLogin.value ? kPurple : null,
                foregroundColor: controller.showLogin.value ? kWhite : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          kWidth10,
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                controller.showLoginCard(false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.showLogin.value ? null : kPurple,
                foregroundColor: controller.showLogin.value ? null : kWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'SignUp',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
