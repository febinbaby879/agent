import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/screens/forms/widgets/course_builder.dart';
import 'package:agent_dashboard/application/presentation/screens/home/home.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/domain/model/application/get_all_application_forms/application.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationStudentCard extends StatefulWidget {
  final ApplicationModel? applicationModel;
  final int index;

  const ApplicationStudentCard(
      {super.key, this.applicationModel, required this.index});

  @override
  State<ApplicationStudentCard> createState() => _ApplicationStudentCardState();
}

class _ApplicationStudentCardState extends State<ApplicationStudentCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Color statusColor;
    // switch (widget.task.parentName.toLowerCase()) {
    //   case 'completed':
    //     statusColor = kGreen;
    //     break;
    //   case 'under review':
    //     statusColor = kpurple400!;
    //     break;
    //   default:
    //     statusColor = kDarkRed;
    // }

    return GestureDetector(
        onTap: () {
          scaffoldKey.currentState?.openEndDrawer();
          Get.find<ApplicationController>().getDetailApplications(
              id: widget.applicationModel?.applicationId ?? "");
        },
        child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: AnimatedContainer(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                    border: Border.all(color: kpurple400!),
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: _isHovered ? boxShadow3 : null),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Expanded(
                                child: Text(allcourses[widget.index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    overflow: TextOverflow.ellipsis)),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: kpurple400,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                    widget.applicationModel?.status ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)))
                          ]),
                          Text(widget.applicationModel?.courseName ?? '',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ])))));
  }
}
