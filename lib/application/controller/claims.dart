import 'package:get/get.dart';

class ClaimsController extends GetxController {
  RxBool claimsListLoading = false.obs;
  RxBool applyClaimLoading = false.obs;
  RxBool claimsDetailLoading = false.obs;
  RxBool refreshing = false.obs;

  Future<void> refreshClaims() async {
    if (refreshing.value) return;
    refreshing.value = true;
    await Future.delayed(const Duration(seconds: 2));
    await applyClaim();
    refreshing.value = false;
  }

  Future<void> applyClaim() async {
    if (applyClaimLoading.value) return;
    applyClaimLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    applyClaimLoading.value = false;
  }
}
