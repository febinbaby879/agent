import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/background_image_hover.dart';
import 'package:agent_dashboard/application/presentation/widgets/custom_listview_builder.dart';
import 'package:flutter/material.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  String selectedStatus = 'Pending';

  @override
  Widget build(BuildContext context) => Container(
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(children: [
            kHeight5,
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: kRed, size: 22)),
            ),
            kHeight20,
            Row(children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: kpurple400,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.assignment, color: kWhite, size: 24)),
              kWidth10,
              Expanded(child: Text('Student Details', style: textHeadStyle1)),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE5E5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  CircleAvatar(radius: 7, backgroundColor: kpurple400),
                  kWidth5,
                  Text('Diploma In Computer Application', style: textHeadStyle1)
                ])),
            kHeight20,
            Row(children: [
              Expanded(
                  child:
                      _buildDetailItem(Icons.person_outline, 'Name', 'Varma')),
              kWidth10,
              Expanded(
                  child: _buildDetailItem(Icons.calendar_today_outlined,
                      'Email', 'varma@gmail.com'))
            ]),
            kHeight20,
            Row(children: [
              Expanded(
                  child: _buildDetailItem(
                      Icons.person_outline, 'DOB', '22/08/1999')),
              kWidth10,
              Expanded(
                  child: _buildDetailItem(Icons.supervisor_account_outlined,
                      'Mobile Number', '0501112222'))
            ]),
            kHeight20,
            Row(children: [
              Expanded(
                  child: _buildDetailItem(Icons.access_time, 'Gender', 'Male')),
              kWidth10,
              Expanded(
                  child: _buildDetailItem(
                      Icons.access_time, 'Merital Status', 'Married'))
            ]),
            kHeight20,
            Row(children: [
              Expanded(
                  child: _buildDetailItem(
                      Icons.access_time, 'Address', 'Wayanad')),
              kWidth10,
              Expanded(
                  child: _buildDetailItem(
                      Icons.access_time, 'Emirates States', 'Mumbai'))
            ]),
            kHeight20,
            Row(children: [
              Expanded(
                  child: _buildDetailItem(
                      Icons.access_time, 'Parent Name', 'George')),
              kWidth10,
              Expanded(
                  child: _buildDetailItem(
                      Icons.access_time, 'Parent Number', '989537885)'))
            ]),
            kHeight20,
            Row(children: [
              Expanded(
                  child: _buildDetailItem(
                      Icons.access_time, 'Parent Passport', '6567878574')),
              kWidth10,
              Expanded(
                  child: _buildDetailItem(
                      Icons.access_time, 'Parent Emirates', '7487853434'))
            ]),
            kHeight20,
            Row(children: [
              Expanded(
                  child: _buildDetailItem(Icons.access_time,
                      'Educational Qualification', 'Degree')),
              kWidth10,
              Expanded(
                  child: _buildDetailItem(
                      Icons.access_time, 'LatestQulification', 'Degree'))
            ]),
            kHeight30,
            Text('Documents', style: textHeadStyle1),
            SizedBox(
                height: 630,
                child: CustomListview(
                    separator: kHeight10,
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: ({required context, required index}) =>
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
          ])));

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
