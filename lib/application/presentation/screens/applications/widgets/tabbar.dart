import 'package:agent_dashboard/application/controller/application/application.dart';
import 'package:agent_dashboard/application/presentation/utils/animations/hover_effect.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    final applicationController = Get.find<ApplicationController>();
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: HoverEffectWidget(
              child: FadeIn(
                  animate: true,
                  child: TabBar(
                      indicatorPadding: const EdgeInsets.all(3),
                      dividerColor: knill,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          color: kpurple400,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      controller: widget.tabController,
                      isScrollable: true,
                      tabs: List.generate(
                          applicationController.applicationTabTitles.length,
                          (index) => Tab(
                                  child: Row(children: [
                                Text(
                                    applicationController
                                        .applicationTabTitles[index],
                                    style: TextStyle(
                                        color:
                                            widget.tabController.index == index
                                                ? kWhite
                                                : kBlack,
                                        fontWeight:
                                            widget.tabController.index == index
                                                ? FontWeight.bold
                                                : FontWeight.normal)),
                                kWidth5,
                                Text(
                                    '${applicationController.tabCounts[index]}',
                                    style: TextStyle(
                                        color:
                                            widget.tabController.index == index
                                                ? kWhite
                                                : kBlack))
                              ]))))))),
      kWidth10,
      ElevatedButton(
          onPressed: () => _showSortOptions(context),
          style: ElevatedButton.styleFrom(
              backgroundColor: kpurple400,
              foregroundColor: kWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: const Text('Sort'))
    ]);
  }

  void _showSortOptions(BuildContext context) {
    final applicationController = Get.find<ApplicationController>();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Sort Tasks By'),
              content: Column(mainAxisSize: MainAxisSize.min, children: [
                _buildSortOption('Title', 'title'),
                _buildSortOption('Priority', 'priority'),
                _buildSortOption('Due Date', 'dueDate'),
                _buildSortOption('Status', 'status')
              ]),
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
            }));
  }
}
