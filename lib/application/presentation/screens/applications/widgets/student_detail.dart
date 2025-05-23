import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  String selectedStatus = 'Pending';

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CircleAvatar(
                  radius: 20,
                  backgroundColor: kpurple400,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: kWhite))),
              kHeight20,
              Text('Student Details', style: textHeadStyle1),
              kHeight10,
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8D5FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.assignment,
                      color: Color(0xFF7B2CBF),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Agent Dashboard Creation',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              kHeight15,
              Row(children: [
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE5E5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFFDC2626),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text('High Priority',
                          style: TextStyle(
                              color: Color(0xFFDC2626),
                              fontSize: 14,
                              fontWeight: FontWeight.w500))
                    ])),
                const SizedBox(width: 12),
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

              kHeight30,

              // Details grid
              Row(children: [
                Expanded(
                    child: _buildDetailItem(
                        Icons.person_outline, 'Created by', 'Root')),
                Expanded(
                    child: _buildDetailItem(Icons.calendar_today_outlined,
                        'Due date', 'Apr 16th, 2025'))
              ]),

              kHeight20,

              Row(children: [
                Expanded(
                    child: _buildDetailItem(
                        Icons.person_outline, 'Assigned to', 'febin')),
                Expanded(
                    child: _buildDetailItem(
                        Icons.supervisor_account_outlined, 'Supervisor', 'Ben'))
              ]),

              kHeight20,

              Row(children: [
                Expanded(
                  child: _buildDetailItem(
                    Icons.access_time,
                    'Created',
                    'Apr 9th, 2025 3:33 PM',
                  ),
                ),
                Expanded(
                    child: _buildDetailItem(Icons.access_time, 'Last updated',
                        'Apr 9th, 2025 3:33 PM'))
              ]),

              kHeight30,

              // Description section
              const Row(children: [
                Icon(Icons.description_outlined, color: Colors.grey),
                SizedBox(width: 8),
                Text('Description',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87))
              ]),

              kHeight15,

              const Text(
                  'Create an agent dashboard as per instructions provided previously.',
                  style: TextStyle(
                      fontSize: 16, color: Colors.black87, height: 1.5)),

              kHeight20,
            ])));
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 6),
        Text(label,
            style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500))
      ]),
      kHeight5,
      Text(value,
          style: const TextStyle(
              fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w500))
    ]);
  }
}
