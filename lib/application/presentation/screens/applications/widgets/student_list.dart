import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:agent_dashboard/application/presentation/widgets/custom_expansion_tile.dart';
import 'package:flutter/material.dart';

class Student {
  final String name;
  final String address;
  final double marks;
  final String status;
  final String parentName;
  final String livingAddress;
  final String education;

  Student({
    required this.name,
    required this.address,
    required this.marks,
    required this.status,
    required this.parentName,
    required this.livingAddress,
    required this.education,
  });
}

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  String selectedStatus = 'All';

  List<Student> students = [
    Student(
      name: 'John Doe',
      address: '123 Main St',
      marks: 85.5,
      status: 'Applied',
      parentName: 'Jane Doe',
      livingAddress: '123 Main St, NY',
      education: 'High School',
    ),
    Student(
      name: 'Alice Smith',
      address: '456 Park Ave',
      marks: 90.0,
      status: 'Enrolled',
      parentName: 'Bob Smith',
      livingAddress: '456 Park Ave, LA',
      education: 'Undergraduate',
    ),
    Student(
      name: 'Mike Johnson',
      address: '789 River Rd',
      marks: 76.5,
      status: 'Cancelled',
      parentName: 'Linda Johnson',
      livingAddress: '789 River Rd, TX',
      education: 'Diploma',
    ),
  ];

  List<String> statuses = ['All', 'Applied', 'Enrolled', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    List<Student> filteredStudents = selectedStatus == 'All'
        ? students
        : students.where((s) => s.status == selectedStatus).toList();

    return Column(children: [
      DropdownButtonFormField<String>(
          dropdownColor: kWhite,
          value: selectedStatus,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Filter by Status'),
          items: statuses
              .map((status) =>
                  DropdownMenuItem(value: status, child: Text(status)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => selectedStatus = value);
            }
          }),
      kHeight20,
      Expanded(
          child: ListView.builder(
              itemCount: filteredStudents.length,
              itemBuilder: (context, index) {
                final student = filteredStudents[index];
                return CustomExpansionTile(
                    borderColor: kpurple400,
                    marginTop: 10,
                    isBorder: true,
                    expansionColor: kCornsilk,
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(student.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text(student.address),
                                Text('Marks: ${student.marks}')
                              ]),
                          _buildStatusBadge(student.status)
                        ]),
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _infoRow('Parent Name:', student.parentName),
                                _infoRow(
                                    'Living Address:', student.livingAddress),
                                _infoRow('Education:', student.education)
                              ]))
                    ]);
              }))
    ]);
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    switch (status) {
      case 'Applied':
        color = Colors.orange;
        break;
      case 'Enrolled':
        color = Colors.green;
        break;
      case 'Cancelled':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
        child: Text(status,
            style: TextStyle(color: color, fontWeight: FontWeight.w600)));
  }

  Widget _infoRow(String title, String content) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('$title ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(content))
        ]));
  }
}
