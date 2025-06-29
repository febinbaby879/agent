import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/agency_details.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/build_steper.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/course_builder.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/emergency_contact_details.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/intake_add_info.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/intake_docs.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/intake_mode_study.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/personal_details.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/container_widget.dart';
import 'package:agent_dashboard/application/presentation/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntakeForm extends StatefulWidget {
  const IntakeForm({super.key});

  @override
  State<IntakeForm> createState() => _IntakeFormState();
}

class _IntakeFormState extends State<IntakeForm> {
  int activeStep = 0;
  int upperBound = 6;
  final bool agreeToTerms = false;
  @override
  Widget build(BuildContext context) {
    final applicationController = Get.find<ApplicationController>();
    double screenWidth = MediaQuery.of(context).size.width;
    final bool isSmallcreen = screenWidth < 700;

    Widget getStepContent(int stepIndex) {
      switch (stepIndex) {
        case 0:
          return const CourseBuilder();
        case 1:
          return const PersonalDetails();
        case 2:
          return const IntakeAndModeOfStudySection();
        case 3:
          return const DocumentSubmissionSection();
        case 4:
          return const AgencyDetails();
        case 5:
          return const EmergencyContactDetails();
        case 6:
          return const AdditionalInformationSection();
        default:
          return kEmpty;
      }
    }

    List<String> stepTitles = const [
      'Choose Course',
      'Personal Information',
      'Intake and Mode of Study',
      'Document Submission',
      'Agency Details ',
      'Emergency Contact Details',
      'Additional Information'
    ];

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
          if (applicationController.selectedCourse.value.isEmpty) {
            showSnackbar('Select Your Preferred Course');
            return false;
          }
          return true;
        case 1: //. Personal Details
          List<String> missingFields = [];
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

        case 2: // Intake and Mode of Study
          if (applicationController.selectedIntakeMonth.value.isEmpty) {
            showSnackbar('Select Your Intake Month');
            return false;
          }
          if (applicationController.selectedModeOfStudy.value.isEmpty) {
            showSnackbar('Select Your Mode of Study');
            return false;
          }
          return true;

        case 3:
          if (applicationController.signedOfferLetterUrl.isEmpty) {
            showSnackbar('Select Your Signed offer letter');
            return false;
          }
          if (applicationController.ticketsUrl.isEmpty) {
            showSnackbar('Select Your Tickets');
            return false;
          }
          return true;
        case 5:
          if (!applicationController.accomodationEmergecyFromKey.currentState!
              .validate()) {
            showSnackbar('Select Your Emergecy Details');
            return false;
          }
          return true;
        case 6:
          if (applicationController.selectedAccommodationAssistance.isEmpty) {
            showSnackbar('Select Your Accommodation assistance');
            return false;
          }
          if (applicationController.airportPickupRequired.isEmpty) {
            showSnackbar('Select Your Airport Pickup');
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
                    Text('Intake application Form',
                        style: textHeadStyle1.copyWith(fontSize: 22)),
                    kHeight15,
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
                                          applicationController.intakeFormSbmit(
                                              applicationID: applicationController
                                                      .getDetaailApplicationFormData
                                                      .value
                                                      .applicationId ??
                                                  '');
                                        }
                                      });
                                    }
                                  })
                            ])),
                    kHeight10,
                    Text(
                        'I hereby declare that the information provided above is true and correct to the best of my knowledge. I understand that providing false or misleading information may lead to disqualification from the program. I consent to the use of my personal data for admission and communication purposes by eduGuardian.',
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
