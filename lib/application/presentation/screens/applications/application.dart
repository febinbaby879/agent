import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/applcation_card.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/summery_cards.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/tabbar.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDashboardScreen extends StatefulWidget {
  const TaskDashboardScreen({super.key});

  @override
  State<TaskDashboardScreen> createState() => _TaskDashboardScreenState();
}

class _TaskDashboardScreenState extends State<TaskDashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          // Summary Cards
          SummaryCardsSection(),

          kHeight20,

          // Tab Bar and Sort Controls
          Tabbar(tabController: _tabController),

          kHeight20,

          // Task Grid
          Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: List.generate(
                      4, (index) => _buildTaskGrid(getApplication(index)))))
        ]));
  }

  Widget _buildTaskGrid(List<ApplicationModel> tasks) {
    // Sort tasks
    _sortTasks(tasks);

    return LayoutBuilder(builder: (context, constraints) {
      int crossAxisCount;
      double childAspectRatio;
      if (constraints.maxWidth > 1200) {
        // Desktop
        crossAxisCount = 4;
        childAspectRatio = 1.5;
      } else if (constraints.maxWidth > 800) {
        // Tablet
        crossAxisCount = 4;
        childAspectRatio = 2.5;
      } else if (constraints.maxWidth > 600) {
        // Tablet
        crossAxisCount = 3;
        childAspectRatio = 2;
      } else if (constraints.maxWidth > 400) {
        // Tablet
        crossAxisCount = 3;
        childAspectRatio = 2;
      } else {
        // Mobile
        crossAxisCount = 2;
        childAspectRatio = 2;
      }

      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          itemCount: tasks.length,
          itemBuilder: (context, index) =>
              ApplicationStudentCard(task: tasks[index]));
    });
  }

  void _sortTasks(List<ApplicationModel> tasks) {
    final applicationController = Get.find<ApplicationController>();
    switch (applicationController.currentSortField) {
      case 'title':
        tasks.sort((a, b) => applicationController.isAscending
            ? a.name.compareTo(b.name)
            : b.name.compareTo(a.name));
        break;
      case 'priority':
        tasks.sort((a, b) {
          int priorityValue(String priority) {
            switch (priority.toLowerCase()) {
              case 'high':
                return 3;
              case 'medium':
                return 2;
              case 'low':
                return 1;
              default:
                return 0;
            }
          }

          return applicationController.isAscending
              ? priorityValue(a.dateOFBirth)
                  .compareTo(priorityValue(b.dateOFBirth))
              : priorityValue(b.dateOFBirth)
                  .compareTo(priorityValue(a.dateOFBirth));
        });
        break;
      case 'dueDate':
        tasks.sort((a, b) => applicationController.isAscending
            ? a.pEmail.compareTo(b.pEmail)
            : b.pEmail.compareTo(a.pEmail));
        break;
      case 'status':
        tasks.sort((a, b) => applicationController.isAscending
            ? a.parentName.compareTo(b.parentName)
            : b.parentName.compareTo(a.parentName));
        break;
    }
  }

  List<ApplicationModel> getApplication(int tabIndex) {
    final List<List<ApplicationModel>> mockApplications = [
      [
        ApplicationModel(
            parentName: 'Isacc',
            id: '1',
            name: 'Varma',
            email: 'varma@gmail.com',
            dateOFBirth: 'high',
            status: 'Pending',
            pEmail: 'varma@gmail.com',
            course: 'MBA',
            mobileNumber: '0501112222',
            gender: true,
            passportNumber: 'P1234561',
            parentPassport: 'PP123451',
            parentEmirates: 'EM123451',
            address: 'Abu Dhabi, UAE',
            country: DateTime(2024, 2, 1),
            workExperience: '3 years teaching',
            position: 'Lecturer',
            companyAddress: true,
            companyContactNumber: true,
            agentaName: 'Agency A',
            agentMobileNumber: '0501112233',
            agentEmailID: 'agent1@edu.com',
            agentCountry: 'UAE',
            passportImages: DateTime(2024, 2, 1),
            passportSizePhoto: 'photo_url_1',
            highestQualificationCertificate: 'MA',
            mastersCertificate: true,
            bachelorsCertificate: 'BA',
            plustTwoALevelCertificate: 'A-Level',
            tenthALevelCertificate: true,
            academicCVCertificate: true),
        ApplicationModel(
            parentName: 'Devid',
            id: '2',
            name: 'Kiran',
            email: 'varma@gmail.com',
            dateOFBirth: '22/09/99',
            status: 'Pending',
            pEmail: 'varma@gmail.com',
            course: 'Engineering',
            mobileNumber: '0503334444',
            passportNumber: 'P1234562',
            parentPassport: 'PP123452',
            parentEmirates: 'EM123452',
            address: 'Dubai, UAE',
            country: DateTime(2024, 3, 1),
            workExperience: '1 year internship',
            position: 'Intern',
            companyAddress: false,
            companyContactNumber: true,
            agentaName: 'Agent B',
            agentMobileNumber: '0502223344',
            agentEmailID: 'agent2@edu.com',
            agentCountry: 'UAE',
            passportImages: DateTime(2024, 3, 1),
            passportSizePhoto: 'photo_url_2',
            highestQualificationCertificate: 'BTech',
            mastersCertificate: false,
            bachelorsCertificate: 'BTech',
            plustTwoALevelCertificate: 'Plus Two',
            tenthALevelCertificate: true,
            academicCVCertificate: false),
        ApplicationModel(
            parentName: 'Isacc',
            id: '3',
            name: 'Scholarship Form',
            email: 'varma@gmail.com',
            dateOFBirth: 'low',
            status: 'Under Review',
            pEmail: 'varma@gmail.com',
            course: 'Law',
            mobileNumber: '0505556666',
            passportNumber: 'P1234563',
            parentPassport: 'PP123453',
            parentEmirates: 'EM123453',
            address: 'Sharjah',
            country: DateTime(2024, 4, 1),
            workExperience: 'None',
            position: 'Student',
            companyAddress: false,
            companyContactNumber: false,
            agentaName: 'EduWorld',
            agentMobileNumber: '0503334455',
            agentEmailID: 'agent3@edu.com',
            agentCountry: 'UAE',
            passportImages: DateTime(2024, 4, 1),
            passportSizePhoto: 'photo_url_3',
            highestQualificationCertificate: 'BA Law',
            mastersCertificate: false,
            bachelorsCertificate: 'BA',
            plustTwoALevelCertificate: 'Yes',
            tenthALevelCertificate: true,
            academicCVCertificate: true)
      ],
      [
        ApplicationModel(
            parentName: 'Ibrahim',
            id: '4',
            name: 'Moosa',
            email: 'varma@gmail.com',
            dateOFBirth: 'medium',
            status: 'Completed',
            pEmail: 'varma@gmail.com',
            course: 'MBBS',
            mobileNumber: '0507778888',
            gender: true,
            passportNumber: 'P1234564',
            parentPassport: 'PP123454',
            parentEmirates: 'EM123454',
            address: 'Ajman',
            country: DateTime(2024, 5, 1),
            workExperience: '1 year clinic assistant',
            position: 'Assistant',
            companyAddress: true,
            companyContactNumber: false,
            agentaName: 'Global Study',
            agentMobileNumber: '0504445566',
            agentEmailID: 'agent4@edu.com',
            agentCountry: 'India',
            passportImages: DateTime(2024, 5, 1),
            passportSizePhoto: 'photo_url_4',
            highestQualificationCertificate: 'MBBS',
            mastersCertificate: false,
            bachelorsCertificate: 'Pre-Med',
            plustTwoALevelCertificate: 'A-Level',
            tenthALevelCertificate: true,
            academicCVCertificate: true),
        ApplicationModel(
            parentName: 'Subh',
            id: '5',
            name: 'Hakkem',
            email: 'varma@gmail.com',
            dateOFBirth: 'medium',
            status: 'Pending',
            pEmail: 'varma@gmail.com',
            course: 'Finance',
            mobileNumber: '0509990000',
            passportNumber: 'P1234565',
            parentPassport: 'PP123455',
            parentEmirates: 'EM123455',
            address: 'Dubai Marina',
            country: DateTime(2024, 6, 1),
            workExperience: '2 years banking',
            position: 'Clerk',
            companyAddress: true,
            companyContactNumber: true,
            agentaName: 'BankRep',
            agentMobileNumber: '0505556677',
            agentEmailID: 'bankrep@bank.com',
            agentCountry: 'UAE',
            passportImages: DateTime(2024, 6, 1),
            passportSizePhoto: 'photo_url_5',
            highestQualificationCertificate: 'BCom',
            mastersCertificate: false,
            bachelorsCertificate: 'BCom',
            plustTwoALevelCertificate: 'Commerce',
            tenthALevelCertificate: true,
            academicCVCertificate: true)
      ],
      [
        ApplicationModel(
            id: '6',
            parentName: 'Newman',
            name: 'Parveen',
            email: 'varma@gmail.com',
            dateOFBirth: 'high',
            status: 'Pending',
            pEmail: 'varma@gmail.com',
            course: 'IT',
            mobileNumber: '0501234567',
            passportNumber: 'P1234566',
            parentPassport: 'PP123456',
            parentEmirates: 'EM123456',
            address: 'Bur Dubai',
            country: DateTime(2024, 7, 1),
            workExperience: '2 years networking',
            position: 'Technician',
            companyAddress: false,
            companyContactNumber: true,
            agentaName: 'Etisalat Agent',
            agentMobileNumber: '0506667788',
            agentEmailID: 'etisalat@uae.com',
            agentCountry: 'UAE',
            passportImages: DateTime(2024, 7, 1),
            passportSizePhoto: 'photo_url_6',
            highestQualificationCertificate: 'Diploma IT',
            mastersCertificate: false,
            bachelorsCertificate: 'BSc IT',
            plustTwoALevelCertificate: 'Plus Two',
            tenthALevelCertificate: true,
            academicCVCertificate: false),
        ApplicationModel(
            parentName: 'Isacc',
            id: '7',
            name: 'Thankappan',
            email: 'varma@gmail.com',
            dateOFBirth: 'high',
            status: 'Pending',
            pEmail: 'varma@gmail.com',
            course: 'Design',
            mobileNumber: '0507891234',
            passportNumber: 'P1234567',
            parentPassport: 'PP123457',
            parentEmirates: 'EM123457',
            address: 'Al Nahda',
            country: DateTime(2024, 8, 1),
            workExperience: '4 years UI/UX',
            position: 'Designer',
            companyAddress: true,
            companyContactNumber: false,
            agentaName: 'CreativeLab',
            agentMobileNumber: '0507778899',
            agentEmailID: 'creative@ui.com',
            agentCountry: 'India',
            passportImages: DateTime(2024, 8, 1),
            passportSizePhoto: 'photo_url_7',
            highestQualificationCertificate: 'BDes',
            mastersCertificate: false,
            bachelorsCertificate: 'BDes',
            plustTwoALevelCertificate: 'Yes',
            tenthALevelCertificate: true,
            academicCVCertificate: true),
        ApplicationModel(
            parentName: 'Isacc',
            id: '8',
            name: 'Saranya',
            email: 'varma@gmail.com',
            dateOFBirth: 'medium',
            status: 'Pending',
            pEmail: 'varma@gmail.com',
            course: 'Accounting',
            mobileNumber: '0502228899',
            passportNumber: 'P1234568',
            parentPassport: 'PP123458',
            parentEmirates: 'EM123458',
            address: 'Jumeirah',
            country: DateTime(2024, 9, 1),
            workExperience: '5 years auditing',
            position: 'Auditor',
            companyAddress: true,
            companyContactNumber: true,
            agentaName: 'FinConsult',
            agentMobileNumber: '0501237890',
            agentEmailID: 'audit@fin.com',
            agentCountry: 'Canada',
            passportImages: DateTime(2024, 9, 1),
            passportSizePhoto: 'photo_url_8',
            highestQualificationCertificate: 'CA',
            mastersCertificate: true,
            bachelorsCertificate: 'BCom',
            plustTwoALevelCertificate: 'Yes',
            tenthALevelCertificate: true,
            academicCVCertificate: true),
      ],
      [
        ApplicationModel(
            parentName: 'Isacc',
            id: '9',
            name: 'Samuel',
            email: 'varma@gmail.com',
            dateOFBirth: 'high',
            status: 'Completed',
            pEmail: 'varma@gmail.com',
            course: 'HR',
            mobileNumber: '0503214567',
            gender: true,
            passportNumber: 'P1234569',
            parentPassport: 'PP123459',
            parentEmirates: 'EM123459',
            address: 'Deira',
            country: DateTime(2024, 10, 1),
            workExperience: '3 years HR',
            position: 'HR Manager',
            companyAddress: true,
            companyContactNumber: true,
            agentaName: 'HR Global',
            agentMobileNumber: '0509998887',
            agentEmailID: 'hr@corp.com',
            agentCountry: 'UAE',
            passportImages: DateTime(2024, 10, 1),
            passportSizePhoto: 'photo_url_9',
            highestQualificationCertificate: 'MBA HR',
            mastersCertificate: true,
            bachelorsCertificate: 'BBA',
            plustTwoALevelCertificate: 'Yes',
            tenthALevelCertificate: true,
            academicCVCertificate: true),
        ApplicationModel(
            parentName: 'Aruninn',
            id: '10',
            name: 'Niveditha',
            email: 'varma@gmail.com',
            dateOFBirth: 'high',
            status: 'Completed',
            pEmail: 'varma@gmail.com',
            course: 'Marketing',
            mobileNumber: '0504567890',
            passportNumber: 'P1234570',
            parentPassport: 'PP123460',
            parentEmirates: 'EM123460',
            address: 'Karama',
            country: DateTime(2024, 11, 1),
            workExperience: '6 years sales',
            position: 'Sales Lead',
            companyAddress: true,
            companyContactNumber: true,
            agentaName: 'Pitch Masters',
            agentMobileNumber: '0504321234',
            agentEmailID: 'pitch@biz.com',
            agentCountry: 'India',
            passportImages: DateTime(2024, 11, 1),
            passportSizePhoto: 'photo_url_10',
            highestQualificationCertificate: 'MBA Marketing',
            mastersCertificate: true,
            bachelorsCertificate: 'BBA',
            plustTwoALevelCertificate: 'Commerce',
            tenthALevelCertificate: true,
            academicCVCertificate: true)
      ]
    ];
    return mockApplications[tabIndex % mockApplications.length];
  }
}

class ApplicationModel {
  final String id;
  final String name;
  final String email;
  final String dateOFBirth;
  final String parentName;
  final String pEmail;
  final String course;
  final String mobileNumber;
  final bool gender;

  final String? passportNumber;
  final String? parentPassport;
  final String? parentEmirates;
  final String? address;
  final DateTime? country;
  final String? workExperience;
  final String? position;
  final bool? companyAddress;
  final bool? companyContactNumber;
  final String? agentaName;
  final String? agentMobileNumber;
  final String? agentEmailID;
  final String? agentCountry;
  final DateTime? passportImages;
  final String? passportSizePhoto;
  final String? highestQualificationCertificate;
  final bool? mastersCertificate;
  final String? bachelorsCertificate;
  final String? plustTwoALevelCertificate;
  final bool? tenthALevelCertificate;
  final bool? academicCVCertificate;
  final String? status;

  ApplicationModel({
    required this.id,
    required this.name,
    required this.email,
    required this.dateOFBirth,
    required this.parentName,
    required this.pEmail,
    required this.course,
    required this.mobileNumber,
    this.gender = false,
    this.passportNumber,
    this.status,
    this.parentPassport,
    this.parentEmirates,
    this.address,
    this.country,
    this.workExperience,
    this.position,
    this.companyAddress,
    this.companyContactNumber,
    this.agentaName,
    this.agentMobileNumber,
    this.agentEmailID,
    this.agentCountry,
    this.passportImages,
    this.passportSizePhoto,
    this.highestQualificationCertificate,
    this.mastersCertificate,
    this.bachelorsCertificate,
    this.plustTwoALevelCertificate,
    this.tenthALevelCertificate,
    this.academicCVCertificate,
  });
}
