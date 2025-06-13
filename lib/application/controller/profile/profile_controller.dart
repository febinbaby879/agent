import 'package:agent_dashboard/application/presentation/utils/image_picker/image_picker.dart';
import 'package:agent_dashboard/data/service/profile/profile_service.dart';
import 'package:agent_dashboard/data/shared_preference/shared_preferences.dart';
import 'package:agent_dashboard/domain/model/profile/agent_profile/agent_profile.dart';
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
      designationController = TextEditingController();

  /// profile side panel works with this data
  RxString profileNavItem = 'profile'.obs;

  /// agent profile informations
  Rx<AgentProfile> profileInfo = AgentProfile().obs;

  /// obboarding process status
  RxBool onboardingDone = false.obs;

  RxBool profileinfoLoading = false.obs;
  RxBool profileinfoUpdateLoading = false.obs;
  RxBool enableEdit = false.obs;
  RxBool profileImageLoading = false.obs;
  RxBool passportImageLoading = false.obs;
  RxBool businessLicenseLoading = false.obs;

  @override
  void onInit() {
    getAgentProfileInfo(refresh: true);
    super.onInit();
  }

  void changeProfileNavItem(String value) {
    profileNavItem.value = value;
  }

  void showEdit(bool value) {
    enableEdit.value = value;
  }

  Future<void> getAgentProfileInfo({bool refresh = false}) async {
    if (!refresh && profileinfoLoading.value) return;
    profileinfoLoading.value = true;
    final result = await _profileService.getAgentProfileInfo(
        id: await SharedPreferecesStorage.getUserId());
    result.fold((l) {}, (r) {
      profileInfo.value = r;
      onboardingDone.value = r.onboading ?? false;
      _loadFieldsToTextFields();
    });
    profileinfoLoading.value = false;
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
    result.fold((l) {}, (r) {
      profileInfo.value = r;
      enableEdit.value = false;
      getAgentProfileInfo(refresh: true);
    });
    profileinfoUpdateLoading.value = false;
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
      print('prifle img => ${r.uploadedDocuments?.profileImg}');
      print('prifle img resp=> ${r.uploadedDocuments?.toJson()}');
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
  }
}
