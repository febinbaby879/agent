import 'package:agent_dashboard/application/controller/home/home.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildNavItem extends StatefulWidget {
  const BuildNavItem({
    super.key,
    required this.tabKey,
    required this.icon,
    required this.title,
  });

  final String tabKey;
  final IconData icon;
  final String title;

  @override
  State<BuildNavItem> createState() => _BuildNavItemState();
}

class _BuildNavItemState extends State<BuildNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 900;
    final homeController = Get.find<HomeController>();
    return Obx(() {
      final isSelected =
          homeController.selectedTabContent.value == widget.tabKey;
      return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedScale(
              scale: _isHovered ? 1.03 : 1.0,
              duration: const Duration(milliseconds: 150),
              child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: kRadius5,
                    color: isSelected ? kpurple400 : kWhite,
                    border: isSelected ? null : Border.all(color: kpurple400!),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InkWell(
                          onTap: () => homeController.changeTabContent(
                              item: widget.tabKey),
                          child: Row(children: [
                            Icon(widget.icon,
                                color: isSelected ? kWhite : kpurple400),
                            isSmallScreen ? kEmpty : kWidth15,
                            Expanded(
                                child: AnimatedSize(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    child: isSmallScreen
                                        ? kEmpty // no text on small screen
                                        : Text(widget.title,
                                            style: textHeadStyle1.copyWith(
                                              color: isSelected
                                                  ? kWhite
                                                  : kpurple400,
                                              fontWeight: isSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
                                            maxLines: 2)))
                          ]))))));
    });
  }
}
