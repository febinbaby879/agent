import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/agency_details.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/build_steper.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/course_builder.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/current_address.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/parent_details.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/personal_details.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/qualification_details.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/working_experience.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/container_widget.dart';
import 'package:agent_dashboard/application/presentation/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentApllicationForm extends StatefulWidget {
  const StudentApllicationForm({super.key});

  @override
  State<StudentApllicationForm> createState() => _StudentApllicationFormState();
}

class _StudentApllicationFormState extends State<StudentApllicationForm> {
  int activeStep = 0;
  int upperBound = 6;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallcreen = screenWidth < 700;
    Widget getStepContent(int stepIndex) {
      switch (stepIndex) {
        case 0:
          return const CourseBuilder();
        case 1:
          return const PersonalDetails();
        case 2:
          return ParentDetails();
        case 3:
          return const CurrentAddress();
        case 4:
          return const QualificationFilesDetails();
        case 5:
          return const WorkExperience();
        case 6:
          return const AgencyDetails();
        default:
          return kEmpty;
      }
    }

    final formController = Get.find<ApplicationController>();

    bool validateCurrentStep() {
      showSnackbar(String message) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          backgroundColor: kRed,
          behavior: SnackBarBehavior.floating,
        ));
      }

      switch (activeStep) {
        case 0:
          if (formController.selectedCourse.value.isEmpty) {
            showSnackbar('Select Your Preferred Course');
            return false;
          }
          return true;
        case 1:
          List<String> missingFields = [];
          if (!formController.personalFormKey.currentState!.validate()) {
            missingFields.add("Personal Details");
          }
          if (formController.selectedGender.value.isEmpty) {
            missingFields.add("Gender");
          }
          if (formController.personalDOBController.text.isEmpty) {
            missingFields.add("Date of Birth");
          }
          if (formController.selectedmeritalStatus.value.isEmpty) {
            missingFields.add("Marital Status");
          }
          if (missingFields.isNotEmpty) {
            showSnackbar("Please select: ${missingFields.join(', ')}");
            return false;
          }
          return true;
        case 2: //  Parent
          if (!formController.parentFormKey.currentState!.validate()) {
            showSnackbar('Please Fill Your Parent Details');
            return false;
          }
          return true;
        case 3: //  address
          if (!formController.currentAddressFormKey.currentState!.validate()) {
            showSnackbar('Please Fill Your Current Address');
            return false;
          }
          return true;
        case 4: // Final Submission
          List<String> missingDocs = [];
          if (formController.passportImages.isEmpty) {
            missingDocs.add("Passport Image");
          }
          if (formController.passportSizePhoto.isEmpty) {
            missingDocs.add("Passport Size Photo");
          }
          if (formController.highestQualificationCertificate.isEmpty) {
            missingDocs.add("Highest Qualification Certificate");
          }
          if (formController.academicCVCertificate.isEmpty) {
            missingDocs.add("Updated Resume Certificate");
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

    List<String> stepTitles = const [
      'Choose Course',
      'Personal Information',
      'Parent Details',
      'Current Address',
      'Qualification Details',
      'Work Experience',
      'Agency Details'
    ];

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
                                          formController.formSubmit(context);
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
