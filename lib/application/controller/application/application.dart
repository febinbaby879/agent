import 'dart:convert';

import 'package:agent_dashboard/application/presentation/utils/image_picker/image_picker.dart';
import 'package:agent_dashboard/domain/model/image/image_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ApplicationController extends GetxController {
  /// Personal Details Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController personalDOBController = TextEditingController();
  final TextEditingController personalemailController = TextEditingController();
  final TextEditingController marriegeStatusController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passportNumberController =
      TextEditingController();
  final GlobalKey<FormState> personalFormKey = GlobalKey<FormState>();

  /// Current Address
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emiratesStatesController =
      TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final GlobalKey<FormState> currentAddressFormKey = GlobalKey<FormState>();

  /// Parent Controller
  final TextEditingController parentNameController = TextEditingController();
  final TextEditingController parentNumberController = TextEditingController();
  final TextEditingController parentPassportController =
      TextEditingController();
  final TextEditingController parentEmiratesController =
      TextEditingController();
  final GlobalKey<FormState> parentFormKey = GlobalKey<FormState>();

  /// Educationl Qualification Controllers
  final GlobalKey<FormState> educationalQualificationFormKey =
      GlobalKey<FormState>();
  final TextEditingController latestQulificationController =
      TextEditingController();
  final TextEditingController institutionSchoolUniversityController =
      TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  /// Additional Experience or Work Experience
  final TextEditingController workExperienceController =
      TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController companyAddressController =
      TextEditingController();
  final TextEditingController companyContactNumberController =
      TextEditingController();

  /// Additional Info
  final TextEditingController anyYearGapController = TextEditingController();
  final TextEditingController howManyYearsGapController =
      TextEditingController();
  final TextEditingController yearofServicesController =
      TextEditingController();
  final TextEditingController yearGapReasonController = TextEditingController();
  final TextEditingController maxAffordableBudgetController =
      TextEditingController();

  /// Agency Details
  final TextEditingController agentaNameController = TextEditingController();
  final TextEditingController agentMobileNumberController =
      TextEditingController();
  final TextEditingController agentEmailIDController = TextEditingController();
  final TextEditingController agentCountryController = TextEditingController();

  //// Job applying Controllers
  final GlobalKey<FormState> jobApplyFormKey = GlobalKey<FormState>();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController linkedInController = TextEditingController();
  final TextEditingController salaryExpectationController =
      TextEditingController();
  final TextEditingController skillsAndCompetenceController =
      TextEditingController();
  final TextEditingController certificatesAndLiscencesController =
      TextEditingController();
  final TextEditingController refereencesController = TextEditingController();
  final TextEditingController educationalBackGroundController =
      TextEditingController();
  final TextEditingController howDidHearAboutUsController =
      TextEditingController();
  final GlobalKey<FormState> jobDetailsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> jobTitleFormKey = GlobalKey<FormState>();

  /// Documents Selection Object
  RxList<ImageModel?> passportImages = <ImageModel?>[].obs;
  RxList<ImageModel?> passportSizePhoto = <ImageModel?>[].obs;
  RxList<ImageModel?> highestQualificationCertificate = <ImageModel?>[].obs;
  RxList<ImageModel?> mastersCertificate = <ImageModel?>[].obs;
  RxList<ImageModel?> bachelorsCertificate = <ImageModel?>[].obs;
  RxList<ImageModel?> plustTwoALevelCertificate = <ImageModel?>[].obs;
  RxList<ImageModel?> tenthALevelCertificate = <ImageModel?>[].obs;
  RxList<ImageModel?> academicCVCertificate = <ImageModel?>[].obs;
  RxList<ImageModel?> universiyAdditionProposal = <ImageModel?>[].obs;
  RxList<ImageModel?> jobDetails = <ImageModel?>[].obs;
  RxList<ImageModel?> startupProposaldata = <ImageModel?>[].obs;
  RxList<ImageModel?> offerLetterdata = <ImageModel?>[].obs;
  final List<String> applicationTabTitles = [
    'Total Applications',
    'New Applications',
    'Offer Letter',
    'Visa Approved'
  ];

  /// DropDown Selection
  RxString selectedmeritalStatus = ''.obs;
  RxList<String> meritalStatus =
      <String>['Single', 'Married', 'Un Married'].obs;

  RxString selectedGender = ''.obs;
  RxList<String> genders = <String>['Male', 'Female', 'Other'].obs;

  final List<int> tabCounts = [25, 7, 25, 16];
  String currentSortField = 'dueDate';
  bool isAscending = true;
  // Selected Course
  RxString selectedCourse = ''.obs;

  void changeCourse({required String course}) => selectedCourse.value = course;

  void changeMeritalStatus({required String meritalStatus}) =>
      selectedmeritalStatus.value = meritalStatus;

  void changeGender({required String gender}) => selectedGender.value = gender;

  /// Passports add Max 2
  RxBool pickPassportImagesloading = false.obs;
  void pickPassportImages() async {
    pickPassportImagesloading.value = true;
    final pickedImages = await FilePickFile.filePick(
        allowedExtensions: ['png'], allowMultiple: true);

    if (pickedImages.isNotEmpty) {
      pickPassportImagesloading.value = false;
      for (var image in pickedImages) {
        if (image != null &&
            !passportImages.any((existing) =>
                existing?.fileImage?.path == image.fileImage?.path)) {
          passportImages.add(image);
        }
      }
      passportImages.refresh();
    }
    pickPassportImagesloading.value = false;
  }

  void removeImage(ImageModel image) {
    passportImages.remove(image);
    passportImages.refresh();
  }

  void updateImage(ImageModel oldImage, ImageModel newImage) {
    final index = passportImages.indexOf(oldImage);
    if (index != -1) {
      passportImages[index] = newImage;
    }
  }

  /// Passport image Pick
  RxBool pickPasspoertSizePhotoloading = false.obs;
  void pickPasspoertSizePhoto() async {
    pickPasspoertSizePhotoloading.value = true;
    final images = await FilePickFile.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !passportSizePhoto.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        passportSizePhoto.add(image);
      }
      update();
    }
    pickPasspoertSizePhotoloading.value = false;
  }

  // Function to remove the selected image
  void removePassportSizePhoto(ImageModel image) {
    passportSizePhoto.remove(image);
    update();
  }

  // Function to update the existing image
  void updatePassportSizePhoto() async {
    //final index = passportSizeImage.indexOf(oldImage);
    final images = await FilePickFile.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !passportSizePhoto.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        passportSizePhoto[0] = (image);
      }
    }
  }

  /// Highest Qualification Certificate image Pick
  RxBool pickHighestQualificationCertificateloading = false.obs;
  void pickHighestQualificationCertificate() async {
    pickHighestQualificationCertificateloading.value = true;
    final images = await FilePickFile.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !highestQualificationCertificate.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        highestQualificationCertificate.add(image);
      }
      update();
    }
    pickHighestQualificationCertificateloading.value = false;
  }

  // Function to remove the Highest Qualification Certificate image
  void removeHighestQualificationCertificate(ImageModel image) {
    highestQualificationCertificate.remove(image);
    update();
  }

  /// Masters Certificate
  RxBool pickMastersCertificateloading = false.obs;
  void pickMastersCertificate() async {
    pickMastersCertificateloading.value = true;
    final images = await FilePickFile.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !mastersCertificate.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        mastersCertificate.add(image);
      }
      update();
    }
    pickMastersCertificateloading.value = false;
  }

  // Function to remove the Masters Certificate image
  void removeMastersCertificate(ImageModel image) {
    mastersCertificate.remove(image);
    update();
  }

  /// Bachlers Certificate
  RxBool pickBachlersCertificateloading = false.obs;
  void pickBachlersCertificate() async {
    pickBachlersCertificateloading.value = true;
    final images = await FilePickFile.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !bachelorsCertificate.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        bachelorsCertificate.add(image);
      }
      update();
    }
    pickBachlersCertificateloading.value = false;
  }

  // Function to remove the Bachlers Certificate image
  void removeBachlersCertificate(ImageModel image) {
    bachelorsCertificate.remove(image);
    update();
  }
  /////

  /// PlusTwo Certificate
  RxBool pickPlusTwoCertificateloading = false.obs;
  void pickPlusTwoCertificate() async {
    pickPlusTwoCertificateloading.value = true;
    final images = await FilePickFile.filePick(allowedExtensions: [
      'jpeg',
      'jpg',
      'png',
    ], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !plustTwoALevelCertificate.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        plustTwoALevelCertificate.add(image);
      }
      update();
    }
    pickPlusTwoCertificateloading.value = false;
  }

  // Function to remove the PlusTwo Certificate image
  void removePlusTwoCertificate(ImageModel image) {
    plustTwoALevelCertificate.remove(image);
    update();
  }

  /// Tenth Certificate
  RxBool pickTenthCertificatloading = false.obs;
  void pickTenthCertificate() async {
    pickTenthCertificatloading.value = true;
    final images = await FilePickFile.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !tenthALevelCertificate.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        tenthALevelCertificate.add(image);
      }
      update();
    }
    pickTenthCertificatloading.value = false;
  }

  // Function to remove the TenthCertificate image
  void removeTenthCertificate(ImageModel image) {
    tenthALevelCertificate.remove(image);
    update();
  }

  /// CV Certificate
  RxBool pickCVCertificateloading = false.obs;
  void pickCVCertificate() async {
    pickCVCertificateloading.value = true;
    final images = await FilePickFile.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !academicCVCertificate.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        academicCVCertificate.add(image);
      }
      update();
    }
    pickCVCertificateloading.value = false;
  }

  // Function to remove the CVCertificate image
  void removeCVCertificate(ImageModel image) {
    academicCVCertificate.remove(image);
    update();
  }

  /// University Addition Proposa
  RxBool pickUniversityProposaloading = false.obs;
  void pickUniversityProposal() async {
    pickUniversityProposaloading.value = true;
    final images = await FilePickFile.filePick(
        allowedExtensions: ['pdf'], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !universiyAdditionProposal.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        universiyAdditionProposal.add(image);
      }
      update();
    }
    pickUniversityProposaloading.value = false;
  }

  // Function to remove the University Addition Proposal image
  void removeUniversityProposal(ImageModel image) {
    universiyAdditionProposal.remove(image);
    update();
  }

  /// job Details
  RxBool pickJobDetailsDatloading = false.obs;
  void pickJobDetailsData() async {
    pickJobDetailsDatloading.value = true;
    final images = await FilePickFile.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg', 'pdf'], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !jobDetails.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        jobDetails.add(image);
      }
      update();
    }
    pickJobDetailsDatloading.value = false;
  }

  // Function to remove the job Details image
  void removejobDetailsImage(ImageModel image) {
    jobDetails.remove(image);
    update();
  }

  RxBool pickStartupDataloading = false.obs;
  void pickStartupData() async {
    pickStartupDataloading.value = true;
    final pickedImages = await FilePickFile.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: true);

    // Add new images, avoiding duplicates
    for (var image in pickedImages) {
      if (image != null &&
          !startupProposaldata.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        startupProposaldata.add(image);
      }
    }
    pickStartupDataloading.value = false;
  }

  // Method to remove an image
  void removeStartupDataImage(ImageModel image) {
    startupProposaldata.remove(image);
    update();
  }

  // oFfer Letter
  RxBool pickOfferLetterloading = false.obs;
  void pickOfferLetter() async {
    pickOfferLetterloading.value = false;
    final pickedImages = await FilePickFile.filePick(
        allowedExtensions: ['pdf'], allowMultiple: true);

    // Add new images, avoiding duplicates
    for (var image in pickedImages) {
      if (image != null &&
          !offerLetterdata.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        offerLetterdata.add(image);
      }
    }
    pickOfferLetterloading.value = false;
  }

  void removeOfferLetter(ImageModel image) {
    offerLetterdata.remove(image);
    update();
  }

  void formSubmit(BuildContext context) async {
    final Map<String, String> eGAcademyFields = {
      'fullName': firstNameController.text,
      'sureName': secondNameController.text,
      'email': personalemailController.text,
      'phone': mobileNumberController.text,
      'dob': personalDOBController.text,
      'passportNumber': passportNumberController.text,
      'civilStatus': selectedmeritalStatus.value,
      'gender': selectedGender.value,
      'parentName': parentNameController.text,
      'parentPassportNumber': parentPassportController.text,
      'parentEmiratesId': parentEmiratesController.text,
      'courseName': selectedCourse.value,
      'parentPhoneNumber': parentNumberController.text,
      'workExperience': workExperienceController.text,
      'position': positionController.text,
      'companyAddress': companyAddressController.text,
      'companyContactNumber': companyContactNumberController.text,
      'currentAddress': addressController.text,
      'emirates': emiratesStatesController.text,
      'country': countryController.text
    };

    final formData = dio.FormData.fromMap(
        {'serviceName': 'eG Academy', 'fields': jsonEncode(eGAcademyFields)});

    // Add files using the already converted MultipartFile
    if (passportSizePhoto.isNotEmpty &&
        passportSizePhoto.first?.fileImage != null) {
      formData.files.add(MapEntry(
          'passportSizePhoto',
          await dio.MultipartFile.fromFile(
              passportSizePhoto[0]!.fileImage!.path,
              filename:
                  passportSizePhoto[0]!.fileImage!.path.split('/').last)));
    }
    if (highestQualificationCertificate.isNotEmpty &&
        highestQualificationCertificate.first?.fileImage != null) {
      formData.files.add(MapEntry(
          'highQualiFile',
          await dio.MultipartFile.fromFile(
              highestQualificationCertificate[0]!.fileImage!.path,
              filename: highestQualificationCertificate[0]!
                  .fileImage!
                  .path
                  .split('/')
                  .last)));
    }
    if (passportImages.isNotEmpty && passportImages.first?.fileImage != null) {
      formData.files.add(MapEntry(
          'passportFile',
          await dio.MultipartFile.fromFile(passportImages[0]!.fileImage!.path,
              filename: passportImages[0]!.fileImage!.path.split('/').last)));
    }
    if (mastersCertificate.isNotEmpty &&
        mastersCertificate.first?.fileImage != null) {
      formData.files.add(MapEntry(
          'masterCertification',
          await dio.MultipartFile.fromFile(
              mastersCertificate[0]!.fileImage!.path,
              filename:
                  mastersCertificate[0]!.fileImage!.path.split('/').last)));
    }
    if (bachelorsCertificate.isNotEmpty &&
        bachelorsCertificate.first?.fileImage != null) {
      formData.files.add(MapEntry(
          'bachelorCertification',
          await dio.MultipartFile.fromFile(
              bachelorsCertificate[0]!.fileImage!.path,
              filename:
                  bachelorsCertificate[0]!.fileImage!.path.split('/').last)));
    }
    if (plustTwoALevelCertificate.isNotEmpty &&
        plustTwoALevelCertificate.first?.fileImage != null) {
      formData.files.add(MapEntry(
          'plustwoCertification',
          await dio.MultipartFile.fromFile(
              plustTwoALevelCertificate[0]!.fileImage!.path,
              filename: plustTwoALevelCertificate[0]!
                  .fileImage!
                  .path
                  .split('/')
                  .last)));
    }
    if (tenthALevelCertificate.isNotEmpty &&
        tenthALevelCertificate.first?.fileImage != null) {
      formData.files.add(MapEntry(
          'tenthCertification',
          await dio.MultipartFile.fromFile(
              tenthALevelCertificate[0]!.fileImage!.path,
              filename:
                  tenthALevelCertificate[0]!.fileImage!.path.split('/').last)));
    }
    if (academicCVCertificate.isNotEmpty &&
        academicCVCertificate.first?.fileImage != null) {
      formData.files.add(MapEntry(
          'cv',
          await dio.MultipartFile.fromFile(
              academicCVCertificate[0]!.fileImage!.path,
              filename:
                  academicCVCertificate[0]!.fileImage!.path.split('/').last)));
    }
    await formSubmisionApiCall(formData: formData, context: context);
  }

  /// Form Submission api call
  Future<void> formSubmisionApiCall(
      {required dio.FormData formData, required BuildContext context}) async {
    // final data = await applicationFormsRepo.egFormsSubmit(formData);
    // data.fold(
    //   (l) => showSnackbar('Application Form Submission Failed', context, kRed),
    //   (r) => showSnackbar(
    //       'Application Form Submission Sucess', context, kpurple400!),
    // );
  }
}
