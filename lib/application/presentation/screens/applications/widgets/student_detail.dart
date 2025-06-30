import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/background_image_hover.dart';
import 'package:agent_dashboard/application/presentation/widgets/custom_listview_builder.dart';
import 'package:agent_dashboard/application/presentation/widgets/event_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  String selectedStatus = 'Pending';

  @override
  Widget build(BuildContext context) {
    final applicationController = Get.find<ApplicationController>();
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Obx(
              () {
                final applicationDetail =
                    applicationController.getDetaailApplicationFormData.value;
                return applicationController
                        .getDetalApplicationFormLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(children: [
                        kHeight5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(Icons.close,
                                    color: kRed, size: 22)),
                            EventButton(
                                style: textHeadStyle1,
                                color: kRed,
                                text: 'InTake',
                                onTap: () =>
                                    context.go(Routes.intakeApplicationForm))
                          ],
                        ),
                        kHeight20,
                        Row(children: [
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: kpurple400,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Icon(Icons.assignment,
                                  color: kWhite, size: 24)),
                          kWidth10,
                          Expanded(
                              child: Text('Student Details',
                                  style: textHeadStyle1)),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF7E6),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text('Pending',
                                  style: TextStyle(
                                      color: Color(0xFFD97706),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)))
                        ]),
                        kHeight15,
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE5E5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              CircleAvatar(
                                  radius: 7, backgroundColor: kpurple400),
                              kWidth5,
                              Text(
                                  'Course Name : ${applicationDetail.projectInfo?.courseName ?? "N/A"}',
                                  style: textHeadStyle1)
                            ])),
                        kHeight15,
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE5E5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              CircleAvatar(
                                  radius: 7, backgroundColor: kpurple400),
                              kWidth5,
                              Text(
                                  'Agent Project : ${applicationDetail.projectInfo?.agentProject ?? "N/A"}',
                                  style: textHeadStyle1)
                            ])),
                        kHeight20,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.person_outline,
                                  'Name',
                                  applicationDetail.studentInfo?.fullName ??
                                      "")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.calendar_today_outlined,
                                  'Email',
                                  applicationDetail.studentInfo?.emailId ?? ""))
                        ]),
                        kHeight20,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.person_outline,
                                  'DOB',
                                  applicationDetail.studentInfo?.dateOfBirth ??
                                      "")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.supervisor_account_outlined,
                                  'Mobile Number',
                                  applicationDetail.studentInfo?.mobileNumber ??
                                      ""))
                        ]),
                        kHeight20,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Gender',
                                  applicationDetail.studentInfo?.gender ??
                                      "N/A")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Merital Status',
                                  applicationDetail.studentInfo?.civilStatus ??
                                      ''))
                        ]),
                        kHeight20,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Address',
                                  applicationDetail
                                          .addresses?.current?.address ??
                                      'N/A')),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Emirates States',
                                  applicationDetail.addresses?.current?.state ??
                                      ''))
                        ]),
                        kHeight20,
                        Text('Parent Details', style: textHeadStyle1),
                        kHeight10,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Father Name',
                                  applicationDetail
                                          .parentDetails?.father?.name ??
                                      "")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Father Number',
                                  applicationDetail.parentDetails?.father
                                          ?.mobileNumber ??
                                      ""))
                        ]),
                        kHeight20,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Father Passport',
                                  applicationDetail.parentDetails?.father
                                          ?.passportNumber ??
                                      "")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Father Emirates ID',
                                  applicationDetail.parentDetails?.father
                                          ?.emiratesIdNumber ??
                                      ""))
                        ]),
                        kHeight20,
                        _buildDetailItem(
                            Icons.email,
                            'Father Email ID',
                            applicationDetail.parentDetails?.father?.emailId ??
                                ""),
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Mother Name',
                                  applicationDetail
                                          .parentDetails?.mother?.name ??
                                      "")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Mother Number',
                                  applicationDetail.parentDetails?.mother
                                          ?.mobileNumber ??
                                      ""))
                        ]),
                        kHeight20,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Mother Passport',
                                  applicationDetail.parentDetails?.mother
                                          ?.passportNumber ??
                                      "")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Mother Emirates ID',
                                  applicationDetail.parentDetails?.mother
                                          ?.emiratesIdNumber ??
                                      ""))
                        ]),
                        kHeight20,
                        _buildDetailItem(
                            Icons.email,
                            'Mother Email ID',
                            applicationDetail.parentDetails?.mother?.emailId ??
                                ""),
                        kHeight20,
                        Text('Educational Qualification Details',
                            style: textHeadStyle1),
                        kHeight10,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Educational Qualification',
                                  applicationDetail
                                          .projectInfo?.highestQualification ??
                                      "")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Institute Name',
                                  applicationDetail
                                          .projectInfo?.instituteName ??
                                      ""))
                        ]),
                        kHeight20,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Start Date',
                                  applicationDetail.projectInfo?.startDate ??
                                      "")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'End Date',
                                  applicationDetail.projectInfo?.endDate ?? ""))
                        ]),
                        kHeight30,
                        Text('Passport Details', style: textHeadStyle1),
                        kHeight10,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Passport Number',
                                  applicationDetail
                                          .passportInfo?.passportNumber ??
                                      "")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Passport Issue Country',
                                  applicationDetail
                                          .passportInfo?.passportIssueCountry ??
                                      ""))
                        ]),
                        kHeight20,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Passport Issue Date',
                                  applicationDetail
                                          .passportInfo?.passportIssueDtae ??
                                      "")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Passport Expiry Date',
                                  applicationDetail
                                          .passportInfo?.passportExpiry ??
                                      ""))
                        ]),
                        Text('Referral Details', style: textHeadStyle1),
                        kHeight10,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Referred By Name',
                                  applicationDetail
                                          .referralInfo?.referredByName ??
                                      "N/A")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Referred Mobile Number',
                                  applicationDetail.referralInfo
                                          ?.referredByMobileNumber ??
                                      "N/A"))
                        ]),
                        kHeight20,
                        Row(children: [
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Referred Email ID',
                                  applicationDetail
                                          .referralInfo?.referredByEmailId ??
                                      "N/A")),
                          kWidth10,
                          Expanded(
                              child: _buildDetailItem(
                                  Icons.access_time,
                                  'Referred Country',
                                  applicationDetail
                                          .referralInfo?.referredByCountry ??
                                      "N/A"))
                        ]),
                        Text('Documents', style: textHeadStyle1),
                        SizedBox(
                            height: 630,
                            child: CustomListview(
                                separator: kHeight10,
                                scrollDirection: Axis.vertical,
                                itemCount: 3,
                                itemBuilder: (
                                        {required context, required index}) =>
                                    const SizedBox(
                                      height: 200,
                                      width: double.infinity,
                                      child: BackgroundImage(
                                          wantRadius: false,
                                          isNetWorkImage: false,
                                          image: 'assets/images/homeimage3.png',
                                          isHovered: false),
                                    ))),
                        kHeight20,
                      ]);
              },
            )));
  }

  Widget _buildDetailItem(IconData icon, String label, String value) =>
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 248, 248),
              borderRadius: kRadius5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(icon, size: 18, color: kpurple400),
              kWidth5,
              Text(label,
                  style: TextStyle(
                      fontSize: 14,
                      color: kpurple400,
                      fontWeight: FontWeight.w500))
            ]),
            Text(value, style: textHeadStyle1)
          ]));
}
