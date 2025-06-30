import 'dart:typed_data';
import 'package:agent_dashboard/application/controller/home/home_controller.dart';
import 'package:agent_dashboard/data/shared_preference/shared_preferences.dart';
import 'package:agent_dashboard/domain/model/application/get_all_application_forms/data.dart';
import 'package:agent_dashboard/domain/model/application/get_detail_apllication_model/data.dart';
import 'package:agent_dashboard/domain/model/application/work_experience.dart';
import 'package:agent_dashboard/domain/model/coutnry_code.dart';
import 'package:http_parser/http_parser.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/image_picker/image_picker.dart';
import 'package:agent_dashboard/application/presentation/utils/snackbar/snackbar.dart';
import 'package:agent_dashboard/data/service/application/application.dart';
import 'package:agent_dashboard/domain/model/image/image_model.dart';
import 'package:agent_dashboard/domain/repository/appliction_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ApplicationController extends GetxController {
  final ApplictionRepo applictionRepo = ApplicationService();

  @override
  void onInit() {
    super.onInit();
    workExperiences.add(WorkExperienceItem());
    //getAllApplications();
  }

  Rx<ApplicationData> allApplicationData = ApplicationData().obs;
  Rx<GetDetailApplicationData> getDetaailApplicationFormData =
      GetDetailApplicationData().obs;

  RxBool getAllApplicationFormsLoading = false.obs;
  RxBool getDetalApplicationFormLoading = false.obs;
  RxBool applyIntakeApplicationFormLoading = false.obs;
  RxBool applyStudentApplicationFormLoading = false.obs;

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

  /// Emergency Contact
  final TextEditingController accomodationEmergecyContactNumberController =
      TextEditingController();
  final TextEditingController accomodationEmergecyRelationshipController =
      TextEditingController();
  final TextEditingController accomodationEmergecyFullNamerController =
      TextEditingController();
  final TextEditingController accomodationEmergecyEmailAddresController =
      TextEditingController();
  final GlobalKey<FormState> accomodationEmergecyFromKey =
      GlobalKey<FormState>();

  /// Current Address
  final TextEditingController addressController = TextEditingController();
  final TextEditingController currentStatesController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final GlobalKey<FormState> currentAddressFormKey = GlobalKey<FormState>();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController currentAddressController =
      TextEditingController();
  final TextEditingController linkedInProfileController =
      TextEditingController();
  final TextEditingController emiratesOrNationalIdController =
      TextEditingController();

  // Add info
  final TextEditingController companyNameeController = TextEditingController();
  final TextEditingController designationOrJobRoleController =
      TextEditingController();

  final TextEditingController passPortNoController = TextEditingController();
  final TextEditingController passportPlaceOfIssueController =
      TextEditingController();
  final TextEditingController passportDateOfIssueController =
      TextEditingController();
  final TextEditingController passportDateOfExpiryController =
      TextEditingController();
  final TextEditingController passportIssueCountryController =
      TextEditingController();
  final GlobalKey<FormState> passPortDetailsFromKey = GlobalKey<FormState>();

  /// Parent Controller
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController fatherNumberController = TextEditingController();
  final TextEditingController fatherPassportController =
      TextEditingController();
  final TextEditingController fatherEmailController = TextEditingController();
  final TextEditingController fatherEmiratesController =
      TextEditingController();

  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController motherNumberController = TextEditingController();
  final TextEditingController motherEmailController = TextEditingController();
  final TextEditingController motherPassportController =
      TextEditingController();
  final TextEditingController motherEmiratesController =
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
  final TextEditingController gradePointController = TextEditingController();

  /// Additional Experience or Work Experience
  final TextEditingController workExperienceController =
      TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController companyAddressController =
      TextEditingController();
  final TextEditingController companyContactNumberController =
      TextEditingController();

// Reffred By
  final GlobalKey<FormState> referredByFormKey = GlobalKey<FormState>();
  final TextEditingController referredNameController = TextEditingController();
  final TextEditingController referredMobileController =
      TextEditingController();
  final TextEditingController referredEmailController = TextEditingController();
  final TextEditingController referredCountryController =
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
  RxList<ImageModel?> passportImagesFront = <ImageModel?>[].obs;
  RxList<ImageModel?> passportImagesBack = <ImageModel?>[].obs;
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
  RxList<ImageModel?> signedOfferLetterUrl = <ImageModel?>[].obs;
  RxList<ImageModel?> ticketsUrl = <ImageModel?>[].obs;
  RxList<ImageModel?> additionalCertificate = <ImageModel?>[].obs;
  final List<String> applicationTabTitles = [
    'Total Applications',
    'New Applications',
    'Offer Letter',
    'Visa Approved'
  ];

  final RxBool pickSignedOfferLetterLoading = false.obs;
  final RxBool pickTicketsLoading = false.obs;

  RxString selectedVisaOption = ''.obs;

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

  // Instead of single controllers
  RxList<WorkExperienceItem> workExperiences = <WorkExperienceItem>[].obs;

  void addWorkExperience() => workExperiences.add(WorkExperienceItem());
  void removeWorkExperience(int index) => workExperiences.removeAt(index);
  List<Map<String, dynamic>> get workExperienceData =>
      workExperiences.map((item) => item.toMap()).toList();

  // ✅ Intake Month (as dropdown or text)
  RxString selectedIntakeMonth = ''.obs;
  // ✅ Mode of Study (as radio — only one selected)
  RxString selectedModeOfStudy = ''.obs;
  // 👉 Available intake months & study modes
  final List<String> intakeMonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final List<String> studyModes = ['On Campus', 'Online', 'Blended'];

  void changeIntakeMonth(String month) {
    selectedIntakeMonth.value = month;
  }

  void changeModeOfStudy(String mode) {
    selectedModeOfStudy.value = mode;
  }

  // ✅ Additional Information controllers
  final arrivalDateController = TextEditingController();
  final arrivalTimeController = TextEditingController();

  // File upload (Flight Ticket)
  final RxString uploadedFlightTicketUrl = ''.obs;
  final RxBool pickFlightTicketLoading = false.obs;

  // Accommodation Assistance
  final RxString selectedAccommodationAssistance = ''.obs; // 'Yes' or 'No'

  void changeAccommodationAssistance(String value) {
    selectedAccommodationAssistance.value = value;
  }

  // ✅ NEW: Airport Pickup
  final RxString airportPickupRequired = ''.obs; // 'Yes' or 'No'

  void changeAirportPickupRequired(String value) {
    airportPickupRequired.value = value;
  }

  void changeCourse({required String course}) => selectedCourse.value = course;

  void changeVisa({required String visa}) => selectedVisaOption.value = visa;

  void changeMeritalStatus({required String meritalStatus}) =>
      selectedmeritalStatus.value = meritalStatus;

  /// Preffred Country
  RxString selectedPreferredCountry = ''.obs;
  RxList<String> preferredCountries = <String>['UK', 'UAE'].obs;
  void changePreferredCountry({required String value}) =>
      selectedPreferredCountry.value = value;

  void changeGender({required String gender}) => selectedGender.value = gender;

  // Selected code Sharjah default code
  RxString selectedCountryCode = '+971'.obs;
  void changeCoutryCode({required String code}) =>
      selectedCountryCode.value = code;

  /// Passports add Max 2
  RxBool pickPassportImagesloading = false.obs;
  void pickPassportImages() async {
    pickPassportImagesloading.value = true;
    final pickedImages = await FilePickerService.pickImage();
    if (pickedImages.isEmpty) return;
    if (pickedImages.isNotEmpty) {
      pickPassportImagesloading.value = false;
      for (var image in pickedImages) {
        if (image != null &&
            !passportImagesFront.any((existing) =>
                existing?.fileImage?.path == image.fileImage?.path)) {
          passportImagesFront.add(image);
        }
      }
      passportImagesFront.refresh();
    }
    pickPassportImagesloading.value = false;
  }

  void removeImage(ImageModel image) {
    passportImagesFront.remove(image);
    passportImagesFront.refresh();
  }

  RxBool pickPassportImagesBackloading = false.obs;
  void pickPassportBackImages() async {
    pickPassportImagesBackloading.value = true;
    final pickedImages = await FilePickerService.pickImage();
    if (pickedImages.isEmpty) return;
    if (pickedImages.isNotEmpty) {
      pickPassportImagesBackloading.value = false;
      for (var image in pickedImages) {
        if (image != null &&
            !passportImagesBack.any((existing) =>
                existing?.fileImage?.path == image.fileImage?.path)) {
          passportImagesBack.add(image);
        }
      }
      update();
    }
    pickPassportImagesBackloading.value = false;
  }

  void removePassportBackImage(ImageModel image) {
    passportImagesBack.remove(image);
    passportImagesBack.refresh();
  }

  /// Passport image Pick
  RxBool pickPasspoertSizePhotoloading = false.obs;
  void pickPasspoertSizePhoto() async {
    pickPasspoertSizePhotoloading.value = true;
    final images = await FilePickerService.pickImage();
    if (images.isEmpty) return;
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
    final images = await FilePickerService.pickImage();
    if (images.isEmpty) return;
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
    final images = await FilePickerService.pickImage();
    if (images.isEmpty) return;
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
    final images = await FilePickerService.pickImage();
    if (images.isEmpty) return;
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
    final images = await FilePickerService.pickImage();
    if (images.isEmpty) return;
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
    final images = await FilePickerService.pickImage();
    if (images.isEmpty) return;
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
    final images = await FilePickerService.pickImage();
    if (images.isEmpty) return;
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
    final images = await FilePickerService.pickImage();
    if (images.isEmpty) return;
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
    final images = await FilePickerService.pickImage();
    if (images.isEmpty) return;
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
  //  Uint8List file;
  RxBool pickJobDetailsDatloading = false.obs;
  void pickJobDetailsData() async {
    pickJobDetailsDatloading.value = true;
    final images = await FilePickerService.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg', 'pdf'], allowMultiple: false);
    if (images.isEmpty) return;
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
    final images = await FilePickerService.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: true);
    if (images.isEmpty) return;
    // Add new images, avoiding duplicates
    for (var image in images) {
      if (image != null &&
          !startupProposaldata.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        startupProposaldata.add(image);
      }
      update();
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
    final images = await FilePickerService.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: true);
    if (images.isEmpty) return;
    // Add new images, avoiding duplicates
    for (var image in images) {
      if (image != null &&
          !offerLetterdata.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        offerLetterdata.add(image);
      }
      update();
    }
    pickOfferLetterloading.value = false;
  }

  void removeOfferLetter(ImageModel image) {
    offerLetterdata.remove(image);
    update();
  }

  /// Additional Certificate image Pick
  RxBool additionalCertificateloading = false.obs;
  void pickadditionalCertificate() async {
    additionalCertificateloading.value = true;
    final images = await FilePickerService.filePick(
        allowedExtensions: ['png', 'jpeg', 'jpg'], allowMultiple: false);
    for (var image in images) {
      if (image != null &&
          !additionalCertificate.any((existing) =>
              existing?.fileImage?.path == image.fileImage?.path)) {
        additionalCertificate.add(image);
      }
      update();
    }
    additionalCertificateloading.value = false;
  }

  // Function to remove the additional Certificate image
  void removeAdditionalCertificate(ImageModel image) {
    highestQualificationCertificate.remove(image);
    update();
  }

  // Offer letter
  void pickSignedOfferLetter() async {
    pickSignedOfferLetterLoading.value = true;
    final pickedImages = await FilePickerService.pickImage();
    if (pickedImages.isEmpty) return;
    if (pickedImages.isNotEmpty) {
      pickSignedOfferLetterLoading.value = false;
      for (var image in pickedImages) {
        if (image != null &&
            !signedOfferLetterUrl.any((existing) =>
                existing?.fileImage?.path == image.fileImage?.path)) {
          signedOfferLetterUrl.add(image);
        }
      }
      update();
    }
    pickSignedOfferLetterLoading.value = false;
  }

  void removeSignedOfferLetter(ImageModel image) {
    signedOfferLetterUrl.remove(image);
    update();
  }

  // Offer letter
  void pickpickTicketsr() async {
    pickTicketsLoading.value = true;
    final pickedImages = await FilePickerService.pickImage();
    if (pickedImages.isEmpty) return;
    if (pickedImages.isNotEmpty) {
      pickTicketsLoading.value = false;
      for (var image in pickedImages) {
        if (image != null &&
            !ticketsUrl.any((existing) =>
                existing?.fileImage?.path == image.fileImage?.path)) {
          ticketsUrl.add(image);
        }
      }
      update();
    }
    pickTicketsLoading.value = false;
  }

  void removeTickets(ImageModel image) {
    ticketsUrl.remove(image);
    update();
  }

  bool yesNoToBool(String? value) {
    if (value == null) return false; // Or throw if null is invalid
    return value.trim().toLowerCase() == 'yes';
  }

  void studentFormSubmit(BuildContext context) async {
    final agentId = await SharedPreferecesStorage.getUserId();
    final Map<String, dynamic> eGAcademyFields = {
      'courseName': selectedCourse.value,
      'preferredCountry': selectedPreferredCountry.value.toLowerCase(),
      'IsVisaRequired': yesNoToBool(selectedVisaOption.value),
      'createdByModel': 'Agent',
      'agentId': agentId,
      'agentProject': 'mibd',
      // Prsonal Details
      'firstName': firstNameController.text,
      'lastName': secondNameController.text,
      'emailId': personalemailController.text,
      'mobileNumber': mobileNumberController.text,
      'dateOfBirth': personalDOBController.text,
      'civilStatus': selectedmeritalStatus.value,
      'gender': selectedGender.value,
      'passportNumber': passportNumberController.text,
      'countryCode': selectedCountryCode.value,
      "nationality": nationalityController.text,
      'emiratesId': emiratesOrNationalIdController.text,
      'passportIssueDtae': passportDateOfIssueController.text,
      'passportExpiry': passportDateOfExpiryController.text,
      'passportIssueCountry': passportIssueCountryController.text,
      // parent
      'fatherName': fatherNameController.text,
      'fatherPassportNumber': fatherPassportController.text,
      'fatherEmiratesIdNumber': fatherEmiratesController.text,
      'fatherMobileNumber': fatherNumberController.text,
      'fatherEmailId': fatherEmailController.text,
      'motherName': motherNameController.text,
      'motherPassportNumber': motherPassportController.text,
      'motherEmiratesIdNumber': motherEmiratesController.text,
      'motherMobileNumber': motherNumberController.text,
      'motherEmailId': motherEmailController.text,
      // Current Addeds
      'currentAddress': addressController.text,
      'currentState': currentStatesController.text,
      'currentCountry': countryController.text.toLowerCase().trim(),
      // Work Experience List data
      'workExperience': workExperienceData,
      //edu Qua
      'highestQualification': latestQulificationController.text.trim(),
      'instituteName': institutionSchoolUniversityController.text.trim(),
      'startDate': startDateController.text.trim(),
      'endDate': endDateController.text.trim(),
      // Refer
      'referredByName': referredNameController.text,
      'referredByMobileNumber': referredMobileController.text,
      'referredByEmailId': referredEmailController.text,
      'referredByCountry': referredCountryController.text,
    };

    var formData = dio.FormData.fromMap(eGAcademyFields);

    // Add files from various lists
    Map<String, RxList<ImageModel?>> fileGroups = {
      'passportSizePhoto': passportSizePhoto,
      'highQualiFile': highestQualificationCertificate,
      'passportFront': passportImagesFront,
      'passportBack': passportImagesBack,
      'bachelorCertification': bachelorsCertificate,
      'masterCertification': mastersCertificate,
      'plustwoCertification': plustTwoALevelCertificate,
      'tenthCertification': tenthALevelCertificate,
      'cv': academicCVCertificate
    };
    for (final entry in fileGroups.entries) {
      final fieldName = entry.key;
      final list = entry.value;

      for (final image in list) {
        final Uint8List? file = image?.webImage;
        if (file != null) {
          formData.files.add(MapEntry(
              fieldName,
              dio.MultipartFile.fromBytes(
                file,
                filename: '$fieldName.png',
                contentType: MediaType('image', 'png'),
              )));
        }
      }
    }
    applyStudentApplicationFormLoading.value = true;
    final datas =
        await applictionRepo.studentApplicationFormSubmit(formdata: formData);
    datas.fold(
        (l) => showGetxSnackabar(
            message: 'Application Form Submission Failed',
            backgroundColor: kRed,
            title: ''),
        (r) => showGetxSnackabar(
            message: 'Application Form Submission Success',
            backgroundColor: kpurple400!,
            title: ''));
    applyStudentApplicationFormLoading.value = false;
  }

  void intakeFormSbmit({required String applicationID}) async {
    final intakeFormData = {
      // Contact Information
      'activeWhatsappNumber': 'hbdfjhd',
      // Prsonal Details
      'firstName': firstNameController.text,
      'lastName': secondNameController.text,
      'emailId': personalemailController.text,
      'mobileNumber': mobileNumberController.text,
      'dateOfBirth': personalDOBController.text,
      'civilStatus': selectedmeritalStatus.value,
      'gender': selectedGender.value,
      'passportNumber': passportNumberController.text,
      'countryCode': selectedCountryCode.value,
      "nationality": nationalityController.text,
      'emiratesId': emiratesOrNationalIdController.text,
      'passportIssueDtae': passportDateOfIssueController.text,
      'passportExpiry': passportDateOfExpiryController.text,
      'passportIssueCountry': passportIssueCountryController.text,
      // Academic Information
      'intakeMonth': selectedIntakeMonth.value,
      // Study Information
      'modeOfStudy':
          'online', // normalizeModeOfStudy(selectedModeOfStudy.value), //
      // Emergency Contact Details
      'emergencyContactName':
          accomodationEmergecyFullNamerController.text.trim(),
      'emergencyContactNumber':
          accomodationEmergecyContactNumberController.text.trim(),
      'emergencyContactEmailId':
          accomodationEmergecyEmailAddresController.text.trim(),
      'emergencyContactRelationship':
          accomodationEmergecyRelationshipController.text.trim(),
      // Travel Information
      'flightTicket': uploadedFlightTicketUrl.value,
      'dateOfArrival': arrivalDateController.text
          .trim(), // convert to Date format at backend if needed
      'timeOfArrival': arrivalTimeController.text.trim(),
      // Services Required (Yes/No ➜ Boolean)
      'requireAccommodation':
          yesNoToBool(selectedAccommodationAssistance.value),
      'requireAirportPickup': yesNoToBool(airportPickupRequired.value),
      // Agreement
      'agreeTermsAndConditions': true,
    };

    var formData = dio.FormData.fromMap(intakeFormData);

    Map<String, RxList<ImageModel?>> fileGroups = {
      'signedOfferLetter': signedOfferLetterUrl,
      'flightTicket': ticketsUrl
    };

    for (final entry in fileGroups.entries) {
      final fieldName = entry.key;
      final list = entry.value;

      for (final image in list) {
        final Uint8List? file = image?.webImage;
        if (file != null) {
          formData.files.add(MapEntry(
              fieldName,
              dio.MultipartFile.fromBytes(file,
                  filename: '$fieldName.png',
                  contentType: MediaType('image', 'png'))));
        }
      }
    }
    applyIntakeApplicationFormLoading.value = true;
    final datas = await applictionRepo.intakeFormSubmit(
        formdata: formData, applicationID: 'AS250611');
    datas.fold(
        (l) => showGetxSnackabar(
            message: 'Application Form Submission Failed',
            backgroundColor: kRed,
            title: ''),
        (r) => showGetxSnackabar(
            message: 'Application Form Submission Success',
            backgroundColor: kpurple400!,
            title: ''));
    applyIntakeApplicationFormLoading.value = false;
  }

  void getAllApplications() async {
    if (Get.find<HomeController>().selectedTabContent.value == 'applications' &&
        allApplicationData.value.applications != null &&
        allApplicationData.value.applications!.isNotEmpty) return;
    getAllApplicationFormsLoading.value = true;
    final data = await applictionRepo.getAllApplicationForms();
    data.fold(
        (l) => showGetxSnackabar(
            message: l.message ?? '', backgroundColor: kRed, title: ''),
        (r) => allApplicationData.value = r);
    getAllApplicationFormsLoading.value = false;
  }

  void getDetailApplications({required String id}) async {
    getDetalApplicationFormLoading.value = true;
    final data = await applictionRepo.detailApplication(id: id);
    data.fold(
        (l) => showGetxSnackabar(
            message: l.message ?? '', backgroundColor: kRed, title: ''),
        (r) => getDetaailApplicationFormData.value = r);
    getDetalApplicationFormLoading.value = false;
  }

  String? normalizeModeOfStudy(String input) {
    const validModes = {
      'On Campuss': 'on_campus',
      'online': 'online',
      'Blended': 'blended',
    };

    final normalizedInput = input.trim().toLowerCase();

    return validModes[normalizedInput];
  }

  // Country codes list
  final List<CountryCode> countryCodes = [
    CountryCode('Afghanistan', '+93'),
    CountryCode('Albania', '+355'),
    CountryCode('Algeria', '+213'),
    CountryCode('American Samoa', '+1 684'),
    CountryCode('Andorra', '+376'),
    CountryCode('Angola', '+244'),
    CountryCode('Anguilla', '+1 264'),
    CountryCode('Antigua and Barbuda', '+1 268'),
    CountryCode('Argentina', '+54'),
    CountryCode('Armenia', '+374'),
    CountryCode('Aruba', '+297'),
    CountryCode('Australia', '+61'),
    CountryCode('Austria', '+43'),
    CountryCode('Azerbaijan', '+994'),
    CountryCode('Bahamas', '+1 242'),
    CountryCode('Bahrain', '+973'),
    CountryCode('Bangladesh', '+880'),
    CountryCode('Barbados', '+1 246'),
    CountryCode('Belarus', '+375'),
    CountryCode('Belgium', '+32'),
    CountryCode('Belize', '+501'),
    CountryCode('Benin', '+229'),
    CountryCode('Bhutan', '+975'),
    CountryCode('Bolivia', '+591'),
    CountryCode('Bosnia and Herzegovina', '+387'),
    CountryCode('Botswana', '+267'),
    CountryCode('Brazil', '+55'),
    CountryCode('Brunei', '+673'),
    CountryCode('Bulgaria', '+359'),
    CountryCode('Burkina Faso', '+226'),
    CountryCode('Burundi', '+257'),
    CountryCode('Cambodia', '+855'),
    CountryCode('Cameroon', '+237'),
    CountryCode('Canada', '+1'),
    CountryCode('Cape Verde', '+238'),
    CountryCode('Cayman Islands', '+1 345'),
    CountryCode('Central African Republic', '+236'),
    CountryCode('Chad', '+235'),
    CountryCode('Chile', '+56'),
    CountryCode('China', '+86'),
    CountryCode('Colombia', '+57'),
    CountryCode('Comoros', '+269'),
    CountryCode('Congo (DRC)', '+243'),
    CountryCode('Congo (Republic)', '+242'),
    CountryCode('Costa Rica', '+506'),
    CountryCode('Croatia', '+385'),
    CountryCode('Cuba', '+53'),
    CountryCode('Cyprus', '+357'),
    CountryCode('Czech Republic', '+420'),
    CountryCode('Denmark', '+45'),
    CountryCode('Djibouti', '+253'),
    CountryCode('Dominica', '+1 767'),
    CountryCode('Dominican Republic', '+1 809'),
    CountryCode('Ecuador', '+593'),
    CountryCode('Egypt', '+20'),
    CountryCode('El Salvador', '+503'),
    CountryCode('Equatorial Guinea', '+240'),
    CountryCode('Eritrea', '+291'),
    CountryCode('Estonia', '+372'),
    CountryCode('Eswatini', '+268'),
    CountryCode('Ethiopia', '+251'),
    CountryCode('Fiji', '+679'),
    CountryCode('Finland', '+358'),
    CountryCode('France', '+33'),
    CountryCode('Gabon', '+241'),
    CountryCode('Gambia', '+220'),
    CountryCode('Georgia', '+995'),
    CountryCode('Germany', '+49'),
    CountryCode('Ghana', '+233'),
    CountryCode('Greece', '+30'),
    CountryCode('Grenada', '+1 473'),
    CountryCode('Guatemala', '+502'),
    CountryCode('Guinea', '+224'),
    CountryCode('Guinea-Bissau', '+245'),
    CountryCode('Guyana', '+592'),
    CountryCode('Haiti', '+509'),
    CountryCode('Honduras', '+504'),
    CountryCode('Hong Kong', '+852'),
    CountryCode('Hungary', '+36'),
    CountryCode('Iceland', '+354'),
    CountryCode('India', '+91'),
    CountryCode('Indonesia', '+62'),
    CountryCode('Iran', '+98'),
    CountryCode('Iraq', '+964'),
    CountryCode('Ireland', '+353'),
    CountryCode('Israel', '+972'),
    CountryCode('Italy', '+39'),
    CountryCode('Jamaica', '+1 876'),
    CountryCode('Japan', '+81'),
    CountryCode('Jordan', '+962'),
    CountryCode('Kazakhstan', '+7'),
    CountryCode('Kenya', '+254'),
    CountryCode('Kiribati', '+686'),
    CountryCode('Kuwait', '+965'),
    CountryCode('Kyrgyzstan', '+996'),
    CountryCode('Laos', '+856'),
    CountryCode('Latvia', '+371'),
    CountryCode('Lebanon', '+961'),
    CountryCode('Lesotho', '+266'),
    CountryCode('Liberia', '+231'),
    CountryCode('Libya', '+218'),
    CountryCode('Liechtenstein', '+423'),
    CountryCode('Lithuania', '+370'),
    CountryCode('Luxembourg', '+352'),
    CountryCode('Macau', '+853'),
    CountryCode('Madagascar', '+261'),
    CountryCode('Malawi', '+265'),
    CountryCode('Malaysia', '+60'),
    CountryCode('Maldives', '+960'),
    CountryCode('Mali', '+223'),
    CountryCode('Malta', '+356'),
    CountryCode('Marshall Islands', '+692'),
    CountryCode('Mauritania', '+222'),
    CountryCode('Mauritius', '+230'),
    CountryCode('Mexico', '+52'),
    CountryCode('Micronesia', '+691'),
    CountryCode('Moldova', '+373'),
    CountryCode('Monaco', '+377'),
    CountryCode('Mongolia', '+976'),
    CountryCode('Montenegro', '+382'),
    CountryCode('Morocco', '+212'),
    CountryCode('Mozambique', '+258'),
    CountryCode('Myanmar', '+95'),
    CountryCode('Namibia', '+264'),
    CountryCode('Nauru', '+674'),
    CountryCode('Nepal', '+977'),
    CountryCode('Netherlands', '+31'),
    CountryCode('New Zealand', '+64'),
    CountryCode('Nicaragua', '+505'),
    CountryCode('Niger', '+227'),
    CountryCode('Nigeria', '+234'),
    CountryCode('North Korea', '+850'),
    CountryCode('North Macedonia', '+389'),
    CountryCode('Norway', '+47'),
    CountryCode('Oman', '+968'),
    CountryCode('Pakistan', '+92'),
    CountryCode('Palau', '+680'),
    CountryCode('Palestine', '+970'),
    CountryCode('Panama', '+507'),
    CountryCode('Papua New Guinea', '+675'),
    CountryCode('Paraguay', '+595'),
    CountryCode('Peru', '+51'),
    CountryCode('Philippines', '+63'),
    CountryCode('Poland', '+48'),
    CountryCode('Portugal', '+351'),
    CountryCode('Qatar', '+974'),
    CountryCode('Romania', '+40'),
    CountryCode('Russia', '+7'),
    CountryCode('Rwanda', '+250'),
    CountryCode('Saint Kitts and Nevis', '+1 869'),
    CountryCode('Saint Lucia', '+1 758'),
    CountryCode('Saint Vincent and the Grenadines', '+1 784'),
    CountryCode('Samoa', '+685'),
    CountryCode('San Marino', '+378'),
    CountryCode('Saudi Arabia', '+966'),
    CountryCode('Senegal', '+221'),
    CountryCode('Serbia', '+381'),
    CountryCode('Seychelles', '+248'),
    CountryCode('Sierra Leone', '+232'),
    CountryCode('Singapore', '+65'),
    CountryCode('Slovakia', '+421'),
    CountryCode('Slovenia', '+386'),
    CountryCode('Solomon Islands', '+677'),
    CountryCode('Somalia', '+252'),
    CountryCode('South Africa', '+27'),
    CountryCode('South Korea', '+82'),
    CountryCode('South Sudan', '+211'),
    CountryCode('Spain', '+34'),
    CountryCode('Sri Lanka', '+94'),
    CountryCode('Sudan', '+249'),
    CountryCode('Suriname', '+597'),
    CountryCode('Sweden', '+46'),
    CountryCode('Switzerland', '+41'),
    CountryCode('Syria', '+963'),
    CountryCode('Taiwan', '+886'),
    CountryCode('Tajikistan', '+992'),
    CountryCode('Tanzania', '+255'),
    CountryCode('Thailand', '+66'),
    CountryCode('Timor-Leste', '+670'),
    CountryCode('Togo', '+228'),
    CountryCode('Tonga', '+676'),
    CountryCode('Trinidad and Tobago', '+1 868'),
    CountryCode('Tunisia', '+216'),
    CountryCode('Turkey', '+90'),
    CountryCode('Turkmenistan', '+993'),
    CountryCode('Tuvalu', '+688'),
    CountryCode('Uganda', '+256'),
    CountryCode('Ukraine', '+380'),
    CountryCode('United Arab Emirates', '+971'),
    CountryCode('United Kingdom', '+44'),
    CountryCode('United States', '+1'),
    CountryCode('Uruguay', '+598'),
    CountryCode('Uzbekistan', '+998'),
    CountryCode('Vanuatu', '+678'),
    CountryCode('Vatican City', '+379'),
    CountryCode('Venezuela', '+58'),
    CountryCode('Vietnam', '+84'),
    CountryCode('Yemen', '+967'),
    CountryCode('Zambia', '+260'),
    CountryCode('Zimbabwe', '+263'),
  ];
}
