import 'package:agent_dashboard/application/controller/home/home_controller.dart';
import 'package:agent_dashboard/application/presentation/screens/courses/widgets/courses_card.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/dropdown_builder.dart';
import 'package:agent_dashboard/application/presentation/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Obx(() => homeController.courseLoading.value
        ? Center(child: CircularProgressIndicator(color: kpurple400))
        : homeController.allCourses.value.courses == null ||
                homeController.allCourses.value.courses!.isEmpty
            ? const Center(child: Text('Course Not Available'))
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: [
                      kHeight10,
                      Row(children: [
                        Expanded(
                            child: CustomTextField(
                                hintText: 'Search Course',
                                onTapOutside: () =>
                                    FocusScope.of(context).unfocus())),
                        kWidth10,
                        SizedBox(
                            width: 300,
                            child: Obx(() => CustomDropDownBuilder(
                                items: homeController.projectTopics,
                                onChanged: (data) => homeController
                                    .changeProjectDropDown(data ?? ""),
                                hintText: 'Select Project',
                                selectedvalue: homeController
                                    .selectedProjectDropdown.value)))
                      ]),
                      kHeight10,
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              homeController.allCourses.value.courses?.length ??
                                  0,
                          itemBuilder: (context, index) => CoursesCard(
                              course: homeController
                                  .allCourses.value.courses?[index]))
                    ]))));
  }
}

class Program {
  final String title;
  final String department;
  final String school;
  final String degreeType;
  final String duration;
  final String mode;
  final double tuitionFee;
  final double commission;

  Program(
      {required this.title,
      required this.department,
      required this.school,
      required this.degreeType,
      required this.duration,
      required this.mode,
      required this.tuitionFee,
      required this.commission});
}
