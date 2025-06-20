import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/domain/model/course_model/course.dart';
import 'package:flutter/material.dart';

class CoursesCard extends StatefulWidget {
  final Course? course;

  const CoursesCard({super.key, required this.course});

  @override
  State<CoursesCard> createState() => _CoursesCardState();
}

class _CoursesCardState extends State<CoursesCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
          scale: _isHovered ? 1.03 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: kRadius5,
                  color: kWhite,
                  border: Border.all(color: kpurple400!)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.course?.courseName ?? "",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kBlack))
                        ]),
                    kHeight10,
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       const Icon(Icons.book,
                    //           size: 16, color: Colors.grey),
                    //       kWidth10,
                    //       Text(widget.course.department,
                    //           style: const TextStyle(color: Colors.grey))
                    //     ]),
                    // const SizedBox(height: 4),
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       const Icon(Icons.school,
                    //           size: 16, color: Colors.grey),
                    //       kWidth10,
                    //       Text(widget.course.school,
                    //           style: const TextStyle(color: Colors.grey))
                    //     ]),
                    kHeight15,
                    Column(children: [
                      // BuildInfoCard(
                      //     icon: Icons.school, text: widget.course?.tuitionFeeUSD??''),
                      // BuildInfoCard(
                      //     icon: Icons.access_time,
                      //     text: widget.course?.agentIncentiveUSD.toString()??""),
                      // BuildInfoCard(
                      //     icon: Icons.calendar_today,
                      //     text: widget.course?.visaFeeUSD.toString()??''),
                      BuildInfoCard(
                          icon: Icons.feed,
                          text:
                              'Est Tuition Fee\n€ ${widget.course?.tuitionFeeUsd ?? ''}'),
                      BuildInfoCard(
                          icon: Icons.person,
                          text:
                              'Est Agent Incentive USD\n€ ${widget.course?.agentIncentiveUsd ?? ""}'),
                      BuildInfoCard(
                          icon: Icons.event_available_rounded,
                          text:
                              'Est Visa FeeUSD\n€ ${widget.course?.visaFeeUsd ?? ""}')
                    ])
                  ]))));
}

class BuildInfoCard extends StatelessWidget {
  const BuildInfoCard({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Icon(icon, size: 20, color: kpurple400),
        kWidth10,
        Expanded(child: Text(text, style: textStyle1))
      ]);
}
