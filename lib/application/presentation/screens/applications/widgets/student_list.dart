import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/screens/applications/widgets/summery_cards.dart';
import 'package:agent_dashboard/application/presentation/utils/animations/hover_effect.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:animate_do/animate_do.dart';
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
    final applicationController = Get.find<ApplicationController>();
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          // Summary Cards
          SummaryCardsSection(),

          kHeight20,

          // Tab Bar and Sort Controls
          Row(children: [
            HoverEffectWidget(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: kpurple400!),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: FadeIn(
                      animate: true,
                      child: TabBar(
                          indicatorPadding: const EdgeInsets.all(3),
                          dividerColor: knill,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                              color: kpurple400,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          controller: _tabController,
                          isScrollable: true,
                          tabs: List.generate(
                              applicationController.applicationTabTitles.length,
                              (index) {
                            return Tab(
                                child: Row(children: [
                              Text(
                                applicationController
                                    .applicationTabTitles[index],
                                style: TextStyle(
                                  color: _tabController.index == index
                                      ? kWhite
                                      : kBlack,
                                  fontWeight: _tabController.index == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                              kWidth5,
                              Text(
                                '${applicationController.tabCounts[index]}',
                                style: TextStyle(
                                    color: _tabController.index == index
                                        ? kWhite
                                        : kBlack),
                              )
                            ]));
                          })),
                    ))),
            kWidth10,
            
            ElevatedButton(
                onPressed: () {
                  _showSortOptions(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kpurple400,
                  foregroundColor: kWhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text('Sort'))
          ]),

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

    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine number of columns based on width
        int crossAxisCount;
        double childAspectRatio;
        if (constraints.maxWidth > 1200) {
          // Desktop
          crossAxisCount = 4;
          childAspectRatio = .9;
        } else if (constraints.maxWidth > 800) {
          // Tablet
          crossAxisCount = 3;
          childAspectRatio = 1;
        } else if (constraints.maxWidth > 600) {
          // Tablet
          crossAxisCount = 2;
          childAspectRatio = 1;
        } else if (constraints.maxWidth > 400) {
          // Tablet
          crossAxisCount = 1;
          childAspectRatio = .9;
        } else {
          // Mobile
          crossAxisCount = 1;
          childAspectRatio = 0.9;
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ApplicationCard(task: tasks[index]);
          },
        );
      },
    );
  }

  int _calculateCrossAxisCount(double width) {
    if (width > 1200) {
      return 4; // Large desktop
    } else if (width > 900) {
      return 3; // Desktop
    } else if (width > 600) {
      return 2; // Tablet
    } else {
      return 1; // Mobile
    }
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

  void _showSortOptions(BuildContext context) {
    final applicationController = Get.find<ApplicationController>();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Sort Tasks By'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSortOption('Title', 'title'),
                  _buildSortOption('Priority', 'priority'),
                  _buildSortOption('Due Date', 'dueDate'),
                  _buildSortOption('Status', 'status'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      applicationController.isAscending =
                          !applicationController.isAscending;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text(applicationController.isAscending
                      ? 'Sort Descending'
                      : 'Sort Ascending'),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'))
              ]);
        });
  }

  Widget _buildSortOption(String title, String field) {
    final applicationController = Get.find<ApplicationController>();
    return ListTile(
      title: Text(title),
      leading: Radio<String>(
        value: field,
        groupValue: applicationController.currentSortField,
        onChanged: (value) {
          setState(() {
            applicationController.currentSortField = value!;
          });
          Navigator.of(context).pop();
        },
      ),
    );
  }

  List<ApplicationModel> getApplication(int tabIndex) {
    // Sample tasks for each tab
    final List<List<ApplicationModel>> mockApplications = [
      [
        ApplicationModel(
          id: '1',
          name: 'University Admission',
          email: 'Apply to Canadian University',
          dateOFBirth: 'high',
          parentName: 'Pending',
          pEmail: DateTime(2025, 5, 1),
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
          academicCVCertificate: true,
        ),
        ApplicationModel(
          id: '2',
          name: 'Visa Application',
          email: 'Submit Canada Visa docs',
          dateOFBirth: 'medium',
          parentName: 'Pending',
          pEmail: DateTime(2025, 5, 2),
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
          academicCVCertificate: false,
        ),
        ApplicationModel(
          id: '3',
          name: 'Scholarship Form',
          email: 'Apply for merit scholarship',
          dateOFBirth: 'low',
          parentName: 'Under Review',
          pEmail: DateTime(2025, 5, 3),
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
          academicCVCertificate: true,
        ),
      ],
      [
        ApplicationModel(
          id: '4',
          name: 'Medical Checkup',
          email: 'Schedule for medical',
          dateOFBirth: 'medium',
          parentName: 'Completed',
          pEmail: DateTime(2025, 5, 4),
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
          academicCVCertificate: true,
        ),
        ApplicationModel(
          id: '5',
          name: 'Bank Collaboration',
          email: 'Find a Bank supervisor for Sim card registration facility',
          dateOFBirth: 'medium',
          parentName: 'Pending',
          pEmail: DateTime(2025, 4, 10),
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
          academicCVCertificate: true,
        ),
      ],
      [
        ApplicationModel(
          id: '6',
          name: 'Etisalat Sim Card Provision',
          email: 'Find Etisalat supervisor for Sim card activation',
          dateOFBirth: 'high',
          parentName: 'Pending',
          pEmail: DateTime(2025, 4, 11),
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
          academicCVCertificate: false,
        ),
        ApplicationModel(
          id: '7',
          name: 'App Redesign Project',
          email: 'Lead the redesign of mobile UI/UX',
          dateOFBirth: 'high',
          parentName: 'Pending',
          pEmail: DateTime(2025, 5, 15),
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
          academicCVCertificate: true,
        ),
        ApplicationModel(
            id: '8',
            name: 'Financial Report Q2',
            email: 'Prepare Q2 report for investors',
            dateOFBirth: 'medium',
            parentName: 'Pending',
            pEmail: DateTime(2025, 6, 10),
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
          id: '9',
          name: 'Employee Training Module',
          email: 'Develop onboarding training module',
          dateOFBirth: 'high',
          parentName: 'Completed',
          pEmail: DateTime(2025, 3, 20),
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
          academicCVCertificate: true,
        ),
        ApplicationModel(
          id: '10',
          name: 'Client Presentation',
          email: 'Prepare final pitch deck',
          dateOFBirth: 'high',
          parentName: 'Completed',
          pEmail: DateTime(2025, 3, 15),
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
          academicCVCertificate: true,
        ),
      ]
    ];

    // Return the appropriate task list based on the tab index
    return mockApplications[tabIndex % mockApplications.length];
  }
}

class ApplicationModel {
  final String id;
  final String name;
  final String email;
  final String dateOFBirth;
  final String parentName;
  final DateTime pEmail;
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

class ApplicationCard extends StatefulWidget {
  final ApplicationModel task;

  const ApplicationCard({super.key, required this.task});

  @override
  State<ApplicationCard> createState() => _ApplicationCardState();
}

class _ApplicationCardState extends State<ApplicationCard> {
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

    return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(10),
                boxShadow: _isHovered ? boxShadow1 : boxShadow3),
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and priority
                      Row(children: [
                        Text(widget.task.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(widget.task.parentName,
                                style: TextStyle(
                                    color: statusColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)))
                      ]),

                      // Description
                      Text(widget.task.email,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),

                      // Status and due date
                      Row(children: [
                        const Spacer(),
                        Icon(Icons.calendar_today,
                            size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                            '${widget.task.pEmail.day}/${widget.task.pEmail.month}/${widget.task.pEmail.year}',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12))
                      ]),

                      kHeight15,

                      // Assigned by and to
                      Row(children: [
                        CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.grey[300],
                            child: Text(widget.task.course.substring(0, 1),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))),
                        const SizedBox(width: 4),
                        Text(widget.task.course,
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 12)),
                        const Spacer(),
                        CircleAvatar(
                            radius: 14,
                            backgroundColor: Colors.grey[300],
                            child: Text(
                                widget.task.mobileNumber.substring(0, 1),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))),
                        const SizedBox(width: 4),
                        Text(
                          widget.task.mobileNumber,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                          ),
                        ),
                        if (widget.task.gender) ...[
                          const SizedBox(width: 4),
                          Icon(Icons.attach_file,
                              size: 16, color: Colors.grey[600])
                        ],
                      ]),

                      kHeight15,

                      // Action buttons
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        _buildActionButton(
                            Icons.visibility, 'VIEW', Colors.blue)
                      ])
                    ]))));
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(4),
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: label.isEmpty ? 8 : 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: label.isEmpty ? Colors.transparent : color,
              borderRadius: BorderRadius.circular(4),
              border: label.isEmpty ? Border.all(color: color) : null,
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                icon,
                size: 16,
                color: label.isEmpty ? color : kWhite,
              ),
              if (label.isNotEmpty) ...[
                const SizedBox(width: 4),
                Text(label,
                    style: const TextStyle(
                        color: kWhite,
                        fontSize: 12,
                        fontWeight: FontWeight.bold))
              ]
            ])));
  }
}
