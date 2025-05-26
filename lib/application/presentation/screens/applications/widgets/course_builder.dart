import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/utils/responsive/responsive.dart';
import 'package:agent_dashboard/application/presentation/widgets/dropdown_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseBuilder extends StatelessWidget {
  const CourseBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final formController = Get.find<ApplicationController>();
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 10 : 50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          kHeight60,
          const SizedBox(height: 10),
          Text('Choose Your Course',
              style: textHeadStyle1.copyWith(fontSize: 19)),
          kHeight30,
          const Text(
              'Please choose the course you wish to enroll in from the options provided'),
          kHeight20,
          Obx(() => CustomDropDownBuilder(
              items: allcourses,
              hintText: 'Preferred Course',
              onChanged: (course) =>
                  formController.changeCourse(course: course ?? ''),
              selectedvalue: formController.selectedCourse.value))
        ]));
  }
}

List<String> allcourses = [
  "OTHM Level 5 Extended Diploma in Accounting and Business",
  "OTHM Level 5 Extended Diploma in Business Management",
  "OTHM Level 5 Extended Diploma in Information Technology",
  "OTHM Level 5 Extended Diploma in Tourism and Hospitality Management",
  "OTHM Level 7 Diploma in Accounting and Finance",
  "OTHM Level 7 Diploma in Human Resource Management",
  "OTHM Level 7 Diploma in Logistics and Supply Chain Management",
  "OTHM Level 7 Diploma in Project Management",
  "OTHM Level 7 Diploma in Strategic Management and Leadership",
  "OTHM Level 7 Diploma in Tourism and Hospitality Management",
  "General MBA",
  "General MBA (Top Up)",
  "MSc Software Engineering",
  "MSC Accountancy & Financial Management",
  "MSc Cloud and Network Security",
  "MSC Data Analytics & Technologies",
  "MSC Accountancy & Financial Management (Top Up)",
  "Software Engineering",
  "Software Engineering (Top Up)",
  "Business management",
  "Business management (Top Up)",
  "General MBA",
  "General MBA (Top Up)",
  "MSC in Accounting and Finance",
  "MSc Accounting and Finance (TOP UP)",
  "MSc Human Resources Management",
  "MSc Human Resources Management (Top Up)",
  "Bsc Cyber Security",
  "Bsc Cyber Security (Top Up)",
  "Bsc (Hons) Business management & Strategy",
  "Bsc (Hons) Business management & Strategy (Top Up)",
  "Qualifi Level 5 Extended Diploma in Networking and Cyber Security",
  "Qualifi Level 5 Extended Diploma in Information Technology",
  "Qualifi Level 5 Extended Diploma in IT-Networking",
  "Qualifi Level 5 Extended Diploma in IT-Web Design",
  "Qualifi Level 5 Extended Diploma in Cyber Security",
  "Qualifi Level 5 Extended Diploma in Education and Training Management",
  "Qualifi Level 5 Extended Diploma in IT-E-commerce",
  "Qualifi Level 5 Extended Diploma in Health and Social Care",
  "Qualifi Level 5 Extended Diploma in Hospitality and Tourism Management",
  "Qualifi Level 5 Extended Diploma in Psychology",
  "Qualifi Level 5 Extended Diploma in Accounting and Finance",
  "Qualifi Level 5 Extended Diploma in Law",
  "Qualifi Level 5 Extended Diploma in Business Management",
  "Qualifi Level 7 Diploma in Strategic Management and Leadership",
  "Qualifi Level 7 Diploma in Project Management",
  "Qualifi Level 7 Diploma in Health and Social Care",
  "Qualifi Level 7 Diploma in Psychology",
  "Qualifi Level 7 Diploma in Hospitality and Tourism Management",
  "Qualifi Level 7 Diploma in Human Resource Management",
  "Qualifi Level 7 Diploma in Accounting and Finance",
  "Qualifi Level 7 Diploma in Law",
  "Qualifi Level 7 Diploma in International Business Law",
  "Qualifi Level 7 Diploma in IT",
  "Qualifi Level 7 Diploma in Data Science",
  "Qualifi Level 7 Diploma in Cyber Security",
  "Qualifi Level 7 Diploma in Logistics and Supply Chain Crisis Management",
  "Qualifi Level 7 Diploma in Educational Management and Leadership"
];
