import 'package:agent_dashboard/application/presentation/screens/applications/application.dart';
import 'package:agent_dashboard/application/presentation/screens/home/home.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class ApplicationStudentCard extends StatefulWidget {
  final ApplicationModel task;

  const ApplicationStudentCard({super.key, required this.task});

  @override
  State<ApplicationStudentCard> createState() => _ApplicationStudentCardState();
}

class _ApplicationStudentCardState extends State<ApplicationStudentCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (widget.task.parentName.toLowerCase()) {
      case 'completed':
        statusColor = kGreen;
        break;
      case 'under review':
        statusColor = kpurple400!;
        break;
      default:
        statusColor = kDarkRed;
    }

    return GestureDetector(
        onTap: () => scaffoldKey.currentState?.openEndDrawer(),
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
                                child: Text(widget.task.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    overflow: TextOverflow.ellipsis)),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: statusColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(widget.task.status ?? '',
                                    style: TextStyle(
                                        color: statusColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)))
                          ]),
                          Text(widget.task.email,
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ])))));
  }
}
