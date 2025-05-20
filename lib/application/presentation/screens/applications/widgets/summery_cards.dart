import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

class SummaryCardsSection extends StatelessWidget {
  SummaryCardsSection({super.key});

  final List<Map<String, dynamic>> summaryData = [
    {
      'title': 'Total Applications',
      'count': 25,
      'color': kBeige,
      'iconColor': kpurple400,
      'icon': Icons.pending_actions,
    },
    {
      'title': 'New Applications',
      'count': 25,
      'color': Colors.blue[50],
      'iconColor': Colors.blue,
      'icon': Icons.check_circle,
    },
    {
      'title': 'Offer Letter',
      'count': 16,
      'color': kLightCyan,
      'iconColor': kpurple400,
      'icon': Icons.rate_review,
    },
    {
      'title': 'Visa Approved',
      'count': 7,
      'color': Colors.lightBlue[50],
      'iconColor': Colors.lightBlue,
      'icon': Icons.create
    }
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16),
          itemCount: summaryData.length,
          itemBuilder: (context, index) => SummaryCard(
              title: summaryData[index]['title'],
              count: summaryData[index]['count'],
              color: summaryData[index]['color'],
              iconColor: summaryData[index]['iconColor'],
              icon: summaryData[index]['icon']));
    });
  }
}

class SummaryCard extends StatefulWidget {
  final String title;
  final int count;
  final Color? color;
  final Color? iconColor;
  final IconData icon;

  const SummaryCard({
    super.key,
    required this.title,
    required this.count,
    this.color,
    this.iconColor,
    required this.icon,
  });

  @override
  State<SummaryCard> createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              color: widget.color ?? kWhite,
              borderRadius: BorderRadius.circular(12),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3))
                    ]
                  : [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 1))
                    ]),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.title,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[800])),
                          kHeight10,
                          Text('${widget.count}',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: widget.iconColor ?? kpurple400))
                        ]),
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(widget.icon,
                            color: widget.iconColor ?? kpurple400, size: 30))
                  ]))));
}
