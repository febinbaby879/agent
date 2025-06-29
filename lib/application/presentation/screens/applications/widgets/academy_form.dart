import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/personal_details.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/build_steper.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/course_builder.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/current_address.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/educational_qualification.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/parent_details.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/qualification_details.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/reffred_by.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/working_experience.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/container_widget.dart';
import 'package:agent_dashboard/application/presentation/widgets/dropdown_builder.dart';
import 'package:agent_dashboard/application/presentation/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcademyApplicationForm extends StatefulWidget {
  const AcademyApplicationForm({super.key});

  @override
  State<AcademyApplicationForm> createState() => _AcademyApplicationFormState();
}

class _AcademyApplicationFormState extends State<AcademyApplicationForm> {
  int activeStep = 0;
  int upperBound = 7;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallcreen = screenWidth < 700;

    Widget getStepContent(int stepIndex) {
      switch (stepIndex) {
        case 0:
          return const Column(
              children: [CourseBuilder(), AcademyPreffrredStudyLocation()]);
        case 1:
          return const PersonalDetails();
        case 2:
          return ParentsDetails();
        case 3:
          return const CurrentAddress();
        case 4:
          return const EducationalQualifications();
        case 5:
          return const WorkExperience();
        case 6:
          return const ReferredBy();
        case 7:
          return const QualificationFilesDetails();
        default:
          return kEmpty;
      }
    }

    List<String> stepTitles = const [
      'Choose Course And preferred Country',
      'Personal Information',
      'Parent Details',
      'Current Address',
      'Educational Qualifications',
      'Work Experience',
      'Referred By',
      'Documents'
    ];

    final applicationController = Get.find<ApplicationController>();

    bool validateCurrentStep() {
      showSnackbar(String message) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
            backgroundColor: kRed,
            behavior: SnackBarBehavior.floating));
      }

      switch (activeStep) {
        case 0:
          if (applicationController.selectedCourse.value.isEmpty) {
            showSnackbar('Select Your Preferred Course');
            return false;
          }
          if (applicationController.selectedPreferredCountry.value.isEmpty) {
            showSnackbar('Select Your Preferred Country');
            return false;
          }
          return true;
        case 1:
          List<String> missingFields = [];
          if (applicationController.selectedCountryCode.value.isEmpty) {
            missingFields.add("Country Code");
          }
          if (!applicationController.personalFormKey.currentState!.validate()) {
            missingFields.add("Personal Details");
          }
          if (applicationController.selectedGender.value.isEmpty) {
            missingFields.add("Gender");
          }
          if (applicationController.personalDOBController.text.isEmpty) {
            missingFields.add("Date of Birth");
          }
          if (applicationController.selectedmeritalStatus.value.isEmpty) {
            missingFields.add("Marital Status");
          }
          if (missingFields.isNotEmpty) {
            showSnackbar("Please select: ${missingFields.join(', ')}");
            return false;
          }
          return true;
        case 2: //  Parent
          if (!applicationController.parentFormKey.currentState!.validate()) {
            showSnackbar('Please Fill Your Parent Details');
            return false;
          }
          return true;
        case 3: //  Address
          if (!applicationController.currentAddressFormKey.currentState!
              .validate()) {
            showSnackbar('Please Fill Your Current Address');
            return false;
          }
          return true;
        case 4: // Educational Qualification
          List<String> missingDatas = [];
          if (!applicationController
              .educationalQualificationFormKey.currentState!
              .validate()) {
            showSnackbar('Please Fill Your Educational Qualifications');
            return false;
          }
          if (applicationController.startDateController.text.isEmpty) {
            missingDatas.add("Start Date");
          }
          if (applicationController.endDateController.text.isEmpty) {
            missingDatas.add("End Date");
          }
          if (missingDatas.isNotEmpty) {
            showSnackbar("Please select: ${missingDatas.join(', ')}");
            return false;
          }
          return true;
        case 7: // Final Submission
          List<String> missingDocs = [];
          if (applicationController.passportImagesFront.isEmpty) {
            missingDocs.add("Passport Front side Image");
          }
          if (applicationController.passportImagesBack.isEmpty) {
            missingDocs.add("Passport Back side Image");
          }
          if (applicationController.passportSizePhoto.isEmpty) {
            missingDocs.add("Passport Size Photo");
          }
          if (applicationController.highestQualificationCertificate.isEmpty) {
            missingDocs.add("Highest Qualification Certificate");
          }
          if (applicationController.academicCVCertificate.isEmpty) {
            missingDocs.add("Updated Resume Certificate");
          }
          if (applicationController.tenthALevelCertificate.isEmpty) {
            missingDocs.add("10 th / O level certificate");
          }
          if (missingDocs.isNotEmpty) {
            showSnackbar("Please select: ${missingDocs.join(', ')}");
            return false;
          }
          return true;
        default:
          return true;
      }
    }

    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
          child: Row(children: [
        Expanded(flex: 4, child: Container(color: kWhite)),
        Expanded(flex: 2, child: Container(color: kpurple400))
      ])),
      Row(children: [
        Expanded(
            child: ContainerWidget(
                horizontalMargin: screenWidth < 700
                    ? 10
                    : screenWidth < 1000
                        ? 20
                        : 40,
                verticalMargin: 50,
                horizontalPadding: screenWidth < 700
                    ? 10
                    : screenWidth < 1000
                        ? 20
                        : 30,
                verticalPadding: 30,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                    Text('Start your application',
                        style: textHeadStyle1.copyWith(fontSize: 22)),
                    kHeight15,
                    Text('Welcome to eduGuardian Dubai’s applicant portal!',
                        style: textStyle1),
                    kHeight10,
                    getStepContent(activeStep),
                    kHeight30,
                    if (activeStep == upperBound)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Responsive.isMobile(context) ? 10 : 50),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                  value: _agreeToTerms,
                                  onChanged: (value) =>
                                      setState(() => _agreeToTerms = value!),
                                  activeColor: kpurple400),
                              Expanded(
                                  child: Text(
                                      'I hereby declare that the information provided above is true and correct to the best of my knowledge. I understand that any false or misleading information may result in the cancellation of my admission. I also consent to the use of my data for admission and communication purposes.',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 14)))
                            ]),
                      ),
                    if (activeStep == upperBound) kHeight15,
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Responsive.isMobile(context) ? 10 : 50),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (activeStep > 0)
                                EventButton(
                                    isBorder: true,
                                    borderColor: kpurple400,
                                    style: textStyle1.copyWith(color: kBlack),
                                    width: 100,
                                    borderRadius: 5,
                                    text: 'Previous',
                                    onTap: () => setState(() => activeStep--))
                              else
                                const SizedBox(width: 100),
                              EventButton(
                                  color:
                                      activeStep == upperBound ? kPurple : null,
                                  isBorder: true,
                                  borderColor: activeStep == upperBound
                                      ? kRed
                                      : kpurple400,
                                  style: textStyle1.copyWith(
                                      color: activeStep == upperBound
                                          ? kWhite
                                          : kBlack,
                                      fontWeight: activeStep == upperBound
                                          ? FontWeight.w900
                                          : FontWeight.w600),
                                  width: 100,
                                  borderRadius: 5,
                                  text: activeStep == upperBound
                                      ? 'Submit'
                                      : 'Continue',
                                  onTap: () {
                                    if (validateCurrentStep()) {
                                      setState(() {
                                        if (activeStep < upperBound) {
                                          activeStep++;
                                        } else {
                                          applicationController
                                              .studentFormSubmit(context);
                                        }
                                      });
                                    }
                                  })
                            ])),
                    kHeight10,
                    Text(
                        'Ensuring this data is correct helps us process your application efficiently and stay in touch with you throughout.',
                        style: textThinStyle1.copyWith(fontSize: 10),
                        maxLines: 4)
                  ])))
            ])),
        kHeight30,
        isSmallcreen
            ? kEmpty
            : SizedBox(
                width: 250,
                child: BuildStepper(
                    activeStep: activeStep, stepTitles: stepTitles))
      ])
    ]));
  }
}

class AcademyPreffrredStudyLocation extends StatelessWidget {
  const AcademyPreffrredStudyLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 10 : 50),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        kHeight20,
        const SizedBox(height: 10),
        Text('Preferred Location', style: textHeadStyle1),
        kHeight30,
        Obx(() => CustomDropDownBuilder(
            items: const ['Singapore', 'Dubai'],
            hintText: 'Preferred Study Location',
            onChanged: (course) =>
                formController.changePreferredCountry(value: course ?? ''),
            selectedvalue: formController.selectedPreferredCountry.value))
      ]),
    );
  }
}
