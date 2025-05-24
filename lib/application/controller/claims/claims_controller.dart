import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class ClaimsController extends GetxController {
  RxBool claimsListLoading = false.obs;
  RxBool applyClaimLoading = false.obs;
  RxBool claimsDetailLoading = false.obs;
  RxBool refreshing = false.obs;

  RxInt studentCountClaims = 1.obs;
  RxDouble totalClaims = 0.0.obs;
  RxBool agreeTerms = false.obs;
  RxBool agreeTermsError = false.obs;

  final Debouncer toatlCalcDebouncer =
      Debouncer(delay: const Duration(milliseconds: 300));

  final GlobalKey<FormState> claimFormKey = GlobalKey<FormState>();

  final TextEditingController agentName = TextEditingController();
  final TextEditingController agencyName = TextEditingController();
  final TextEditingController agentContactNumber = TextEditingController();
  final TextEditingController agentEmail = TextEditingController();
  final TextEditingController agentAccountName = TextEditingController();
  final TextEditingController agentIbanNumber = TextEditingController();
  final TextEditingController agentBankName = TextEditingController();
  final TextEditingController agentBankAccountNumber = TextEditingController();
  final TextEditingController agentBankAddress = TextEditingController();
  final TextEditingController agentBankSwiftCode = TextEditingController();
  final List<TextEditingController> studentName = [TextEditingController()];
  final List<TextEditingController> studentRegNumber = [
    TextEditingController()
  ];
  final List<TextEditingController> studentIntake = [TextEditingController()];
  final List<TextEditingController> studentTravelDate = [
    TextEditingController()
  ];
  final List<TextEditingController> studentClaimAmount = [
    TextEditingController()
  ];

  void changeTerms(bool value) {
    agreeTerms.value = value;
    if (value) {
      agreeTermsError.value = false;
    }
  }

  void calculateTotalclaims() {
    toatlCalcDebouncer.call(
      () {
        double total = 0.0;
        for (var e in studentClaimAmount) {
          total += double.tryParse(e.text.trim()) ?? 0.0;
        }
        totalClaims.value = total;
      },
    );
  }

  void addStudent() {
    studentName.add(TextEditingController());
    studentRegNumber.add(TextEditingController());
    studentIntake.add(TextEditingController());
    studentTravelDate.add(TextEditingController());
    studentClaimAmount.add(TextEditingController());
    studentCountClaims.value += 1;
  }

  void removeStudent(int index) {
    if (studentCountClaims.value == 1) return;
    studentName.removeAt(index);
    studentRegNumber.removeAt(index);
    studentIntake.removeAt(index);
    studentTravelDate.removeAt(index);
    studentClaimAmount.removeAt(index);
    studentCountClaims.value -= 1;
    calculateTotalclaims();
  }

  Future<void> refreshClaims() async {
    if (refreshing.value) return;
    refreshing.value = true;
    await Future.delayed(const Duration(seconds: 2));
    await applyClaim();
    refreshing.value = false;
  }

  Future<void> applyClaim() async {
    if (!agreeTerms.value) {
      agreeTermsError.value = true;
      return;
    }
    if (claimFormKey.currentState?.validate() ?? false) {
      agreeTermsError.value = false;
      if (applyClaimLoading.value) return;
      applyClaimLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      applyClaimLoading.value = false;
    }
  }
}
