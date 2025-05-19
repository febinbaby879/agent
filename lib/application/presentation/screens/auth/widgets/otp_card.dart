import 'package:agent_dashboard/application/controller/auth.dart';
import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpCard extends StatelessWidget {
  const OtpCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
            'An OTP has been send to our email address',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF6B7280),
            ),
          ),
          kHeight30,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Pinput(
                length: 6,
                controller: controller.otpSignupController,
                defaultPinTheme: PinTheme(
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                  decoration: BoxDecoration(
                    color: kWhite,
                    boxShadow: boxShadow1,
                    borderRadius: BorderRadius.circular(5),
                    border: const Border(bottom: BorderSide(color: kGrey)),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                  decoration: BoxDecoration(
                    color: kWhite,
                    boxShadow: boxShadow2,
                    borderRadius: BorderRadius.circular(5),
                    border: const Border(bottom: BorderSide(color: kBlack)),
                  ),
                ),
                onChanged: (value) {
                  // Handle OTP value change
                },
                onCompleted: (pin) {
                  // Trigger verification
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Resend OTP?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Obx(
            () => SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  context.go(Routes.agrementSign);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPurple,
                  foregroundColor: kWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: controller.otpLoading.value
                    ? const CircularProgressIndicator(
                        color: kWhite,
                      )
                    : const Text(
                        'Verify Otp',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
