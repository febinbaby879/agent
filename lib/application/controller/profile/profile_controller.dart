import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/image_picker/image_picker.dart';
import 'package:agent_dashboard/application/presentation/utils/toast/flutter_toast.dart';
import 'package:agent_dashboard/data/feature/pdf/pdf_service.dart';
import 'package:agent_dashboard/data/service/profile/profile_service.dart';
import 'package:agent_dashboard/data/shared_preference/shared_preferences.dart';
import 'package:agent_dashboard/domain/model/profile/agent_profile/agent_profile.dart';
import 'package:agent_dashboard/domain/model/profile/agent_profile/social_media_link.dart';
import 'package:agent_dashboard/domain/model/profile/agrement_model/agrement_model.dart';
import 'package:agent_dashboard/domain/model/profile/bank_account_info/bank_account_info.dart';
import 'package:agent_dashboard/domain/model/profile/bank_account_info/bank_operation.dart';
import 'package:agent_dashboard/domain/repository/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileRepo _profileService = ProfileService();

  TextEditingController agentNameController = TextEditingController(),
      agentEmailController = TextEditingController(),
      agentCountryController = TextEditingController(),
      directorNameController = TextEditingController(),
      directorPhoneController = TextEditingController(),
      businessRegNumController = TextEditingController(),
      dateOfBirthController = TextEditingController(),
      websitController = TextEditingController(),
      addressController = TextEditingController(),
      contactPersonController = TextEditingController(),
      designationController = TextEditingController(),
      instagramLink = TextEditingController(),
      twiterLink = TextEditingController(),
      linkedInLink = TextEditingController(),
      youtubeLink = TextEditingController(),
      whatsappLink = TextEditingController(),
      tikTokLink = TextEditingController(),
      faceBookkLink = TextEditingController(),
      bankName = TextEditingController(),
      bankAccountNumber = TextEditingController(),
      bankAddress = TextEditingController(),
      bankSwiftCode = TextEditingController(),
      bankIBAN = TextEditingController(),
      bankAccountHolderName = TextEditingController();

  final GlobalKey<FormState> bankingDetailKey = GlobalKey<FormState>();

  /// profile side panel works with this data
  RxString profileNavItem = 'profile'.obs;

  /// agent profile informations
  Rx<AgentProfile> profileInfo = AgentProfile().obs;

  Rx<BankAccountInfo> selectedBankingInfo = BankAccountInfo().obs;

  /// obboarding process status
  RxBool onboardingDone = false.obs;

  RxBool profileinfoLoading = false.obs;
  RxBool profileinfoUpdateLoading = false.obs;
  RxBool profileinfoUpdateSocialMediaLoading = false.obs;
  RxBool enableEdit = false.obs;
  RxBool profileImageLoading = false.obs;
  RxBool passportImageLoading = false.obs;
  RxBool businessLicenseLoading = false.obs;
  RxBool bankingInfoLoading = false.obs;
  RxBool bankingInfoDeleteLoading = false.obs;
  RxBool isDefaultBanking = false.obs;
  RxBool getAgreementLoading = false.obs;
  RxString bankAccountType = ''.obs;
  Rx<AgrementModel> agrementModel = AgrementModel().obs;

  @override
  void onInit() {
    getAgentProfileInfo(refresh: true);
    super.onInit();
  }

  TextEditingController? getSocialMediaController(String media,
      {bool loadController = false, String? data}) {
    switch (media) {
      case 'Facebook':
        if (loadController) {
          faceBookkLink.text = data ?? '';
        }
        return faceBookkLink;
      case 'Instagram':
        if (loadController) {
          instagramLink.text = data ?? '';
        }
        return instagramLink;
      case 'Twitter':
        if (loadController) {
          twiterLink.text = data ?? '';
        }
        return twiterLink;
      case 'LinkedIn':
        if (loadController) {
          linkedInLink.text = data ?? '';
        }
        return linkedInLink;
      case 'YouTube':
        if (loadController) {
          youtubeLink.text = data ?? '';
        }
        return youtubeLink;
      case 'WhatsApp':
        if (loadController) {
          whatsappLink.text = data ?? '';
        }
        return whatsappLink;
      case 'TikTok':
        if (loadController) {
          tikTokLink.text = data ?? '';
        }
        return tikTokLink;
      default:
        return null;
    }
  }

  void changeProfileNavItem(String value) {
    profileNavItem.value = value;
  }

  void showEdit(bool value) {
    enableEdit.value = value;
  }

  Future<void> getAgentProfileInfo(
      {bool refresh = false, bool banking = false}) async {
    if (!refresh && profileinfoLoading.value) return;
    if (!banking) profileinfoLoading.value = true;
    bankingInfoLoading.value = true;
    final result = await _profileService.getAgentProfileInfo(
        id: await SharedPreferecesStorage.getUserId());
    result.fold((l) {}, (r) {
      profileInfo.value = r;
      onboardingDone.value = r.onboading ?? false;
      _loadFieldsToTextFields();
    });
    profileinfoLoading.value = false;
    bankingInfoLoading.value = false;
  }

  Future<void> updateProfileInfo() async {
    profileinfoUpdateLoading.value = true;
    final result = await _profileService.updateProfileInfo(
        id: await SharedPreferecesStorage.getUserId(),
        profile: AgentProfile(
          designation: designationController.text,
          businessRegNum: businessRegNumController.text,
          fullAddress: addressController.text,
          nameofContactPerson: contactPersonController.text,
          directorContactNumber: directorPhoneController.text,
          directorName: directorNameController.text,
          dateofBirth: dateOfBirthController.text,
          websiteLink: websitController.text,
        ));
    bool success = true;
    result.fold((l) {
      success = false;
      showCustomToast(
          message: l.message ?? errorMessage, backgroundColor: kRed);
    }, (r) {
      enableEdit.value = false;
    });
    if (success) {
      await getAgentProfileInfo(refresh: true);
    }
    profileinfoUpdateLoading.value = false;
  }

  void selectBankAccountInfo(BankAccountInfo? info) {
    print(info?.toJson());
    selectedBankingInfo.value = info ?? BankAccountInfo();
    bankAccountHolderName.text = info?.accountHolderName ?? "";
    bankAccountNumber.text = info?.accountNumber ?? "";
    bankAddress.text = info?.bankAddress ?? "";
    bankName.text = info?.bankName ?? "";
    bankIBAN.text = info?.iban ?? "";
    bankSwiftCode.text = info?.swiftCode ?? "";
    bankAccountType.value = info?.accountType ?? "";
    isDefaultBanking.value = info?.isDefault ?? false;
  }

  void clearBankingControllers() {
    selectedBankingInfo.value = BankAccountInfo();
    bankAccountHolderName.clear();
    bankAccountNumber.clear();
    bankAddress.clear();
    bankName.clear();
    bankIBAN.clear();
    bankSwiftCode.clear();
    bankAccountType.value = '';
    isDefaultBanking.value = false;
  }

  void chooseAccountType(String? value) {
    bankAccountType.value = value ?? "";
  }

  void isDefalutBankingData(bool? value) {
    isDefaultBanking.value = value ?? false;
  }

  Future<bool> addBankAccount() async {
    if (bankingInfoLoading.value) return false;
    if (bankingDetailKey.currentState?.validate() ?? false) {
      bankingInfoLoading.value = true;
      final result = await _profileService.bankingOperation(
        bankingOperation: BankOperation(
          operation: 'add',
          bankData: BankAccountInfo(
            accountHolderName: bankAccountHolderName.text.trim(),
            accountNumber: bankAccountNumber.text.trim(),
            bankAddress: bankAddress.text.trim(),
            bankName: bankName.text.trim(),
            iban: bankIBAN.text.trim(),
            swiftCode: bankSwiftCode.text.trim(),
            accountType:
                bankAccountType.value.isEmpty ? 'other' : bankAccountType.value,
            isDefault: isDefaultBanking.value,
          ),
        ),
      );
      bool success = true;
      result.fold((l) {
        bankingInfoLoading.value = false;
        success = false;
      }, (r) {
        getAgentProfileInfo(banking: true, refresh: true);
      });
      return success;
    }
    return false;
  }

  Future<bool> updateBankAccount() async {
    if (bankingInfoLoading.value) return false;
    if (bankingDetailKey.currentState?.validate() ?? false) {
      bankingInfoLoading.value = true;
      print(selectedBankingInfo.value.toJson());
      final result = await _profileService.bankingOperation(
        bankingOperation: BankOperation(
          operation: 'update',
          bankId: selectedBankingInfo.value.id,
          bankData: BankAccountInfo(
            accountHolderName: bankAccountHolderName.text.trim(),
            accountNumber: bankAccountNumber.text.trim(),
            bankAddress: bankAddress.text.trim(),
            bankName: bankName.text.trim(),
            iban: bankIBAN.text.trim(),
            swiftCode: bankSwiftCode.text.trim(),
            accountType: bankAccountType.value.trim(),
            isDefault: isDefaultBanking.value,
          ),
        ),
      );
      bool success = true;
      result.fold((l) {
        bankingInfoLoading.value = false;
        success = false;
      }, (r) {
        getAgentProfileInfo(banking: true, refresh: true);
      });
      return success;
    }
    return false;
  }

  Future<bool> deleteBankAccount({required String id}) async {
    if (id.isEmpty || bankingInfoDeleteLoading.value) return false;
    bankingInfoDeleteLoading.value = true;
    final result = await _profileService.bankingOperation(
      bankingOperation: BankOperation(
        operation: 'remove',
        bankId: id,
      ),
    );
    bool success = true;
    result.fold((l) {
      bankingInfoDeleteLoading.value = false;
      success = false;
    }, (r) {
      getAgentProfileInfo(banking: true, refresh: true);
    });
    return success;
  }

  Future<void> markDefaultBankAccount() async {
    bankingInfoLoading.value = true;
    final result = await _profileService.bankingOperation(
      bankingOperation: BankOperation(
        operation: 'setDefault',
        bankId: selectedBankingInfo.value.id,
      ),
    );
    result.fold((l) {
      bankingInfoLoading.value = false;
    }, (r) {
      getAgentProfileInfo(banking: true, refresh: true);
    });
  }

  Future<bool> updateSocialMediaLinks() async {
    profileinfoUpdateSocialMediaLoading.value = true;
    List<SocialMediaLink> links = profileInfo.value.socialMediaLinks ?? [],
        updatedLinks = [];
    for (String i in socialMediaPlatforms) {
      final l = links.where((e) => e.platform == i);
      updatedLinks.add(SocialMediaLink(
          platform: i,
          url: getSocialMediaController(i)?.text,
          id: l.isEmpty ? null : l.first.id));
    }
    final result = await _profileService.updateProfileInfo(
        id: await SharedPreferecesStorage.getUserId(),
        profile: AgentProfile(socialMediaLinks: updatedLinks));
    bool success = true;
    result.fold((l) {
      success = false;
      showCustomToast(
          message: l.message ?? errorMessage, backgroundColor: kRed);
    }, (r) => null);
    if (success) {
      await getAgentProfileInfo(refresh: true);
    }
    profileinfoUpdateSocialMediaLoading.value = false;
    return success;
  }

  /// get onboarding status from shared preferences
  Future<bool> getOnboardingStatus() async {
    onboardingDone.value = await SharedPreferecesStorage.getOnBoard();
    return onboardingDone.value;
  }

  /// set onboarding status
  Future<void> setOnboard({bool onboard = true}) async {
    onboardingDone.value = onboard;
    await SharedPreferecesStorage.setOnBoard(onboard);
  }

  /// upload profile picture
  Future<void> uploadProfilePicture() async {
    final image = await FilePickerService.pickImage();
    if (image.isEmpty) return;
    profileImageLoading.value = true;
    final result = await _profileService.uploadFile(
        file: image.first!.webImage!, keyName: 'profileImg');
    result.fold((l) => null, (r) {
      profileInfo.value = profileInfo.value
          .copyWith(profileImg: r.uploadedDocuments?.profileImg);
    });
    profileImageLoading.value = false;
  }

  /// upload business license
  Future<void> uploadBusinessLicense() async {
    final image = await FilePickerService.pickImage();
    if (image.isEmpty) return;
    businessLicenseLoading.value = true;
    final result = await _profileService.uploadFile(
        file: image.first!.webImage!, keyName: 'businessLicense');
    result.fold((l) => null, (r) {
      profileInfo.value = profileInfo.value
          .copyWith(businessLicense: r.uploadedDocuments?.businessLicense);
    });
    businessLicenseLoading.value = false;
  }

  /// upload passport file
  Future<void> uploadPassportFile() async {
    final image = await FilePickerService.pickImage();
    if (image.isEmpty) return;
    passportImageLoading.value = true;
    final result = await _profileService.uploadFile(
        file: image.first!.webImage!, keyName: 'passportFile');
    result.fold((l) => null, (r) {
      profileInfo.value = profileInfo.value
          .copyWith(passportFile: r.uploadedDocuments?.passportFile);
    });
    passportImageLoading.value = false;
  }

  Future<void> getCompletedAgrement() async {
    if (getAgreementLoading.value) return;
    getAgreementLoading.value = true;
    final result = await _profileService.getAgreement(service: 'eGAgent');
    result.fold((l) {
      agrementModel.value = AgrementModel();
    }, (r) {
      agrementModel.value = r;
    });
    getAgreementLoading.value = false;
  }

  Future<void> downloadAgrement()async{
    PdfService.downloadHtmlAsPdf();
  }

  _loadFieldsToTextFields() {
    agentNameController.text = profileInfo.value.agentName ?? '';
    agentEmailController.text = profileInfo.value.agentEmailId ?? '';
    agentCountryController.text = profileInfo.value.agentCountry ?? '';
    websitController.text = profileInfo.value.websiteLink ?? '';
    dateOfBirthController.text = profileInfo.value.dateofBirth ?? '';
    designationController.text = profileInfo.value.designation ?? '';
    addressController.text = profileInfo.value.fullAddress ?? '';
    businessRegNumController.text = profileInfo.value.businessRegNum ?? '';
    directorNameController.text = profileInfo.value.directorName ?? '';
    contactPersonController.text = profileInfo.value.nameofContactPerson ?? '';
    directorPhoneController.text =
        profileInfo.value.directorContactNumber ?? '';
    for (SocialMediaLink link in profileInfo.value.socialMediaLinks ?? []) {
      getSocialMediaController(link.platform ?? '',
          loadController: true, data: link.url);
    }
  }

  _clearTextControllers() {
    agentNameController.clear();
    agentEmailController.clear();
    agentCountryController.clear();
    websitController.clear();
    dateOfBirthController.clear();
    designationController.clear();
    addressController.clear();
    businessRegNumController.clear();
    directorNameController.clear();
    contactPersonController.clear();
    directorPhoneController.clear();
    linkedInLink.clear();
    whatsappLink.clear();
    faceBookkLink.clear();
    instagramLink.clear();
    twiterLink.clear();
    tikTokLink.clear();
    youtubeLink.clear();
  }
}
