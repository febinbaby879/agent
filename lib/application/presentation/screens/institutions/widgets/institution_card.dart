import 'package:agent_dashboard/application/presentation/screens/institutions/institution.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';

enum MenuAction { share, report, bookmark, compare, visitWebsite }

class InstitutionCard extends StatefulWidget {
  const InstitutionCard({super.key, required this.school});
  final School school;

  @override
  State<InstitutionCard> createState() => _InstitutionCardState();
}

class _InstitutionCardState extends State<InstitutionCard> {
  late bool isFavorite;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.school.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    void handleMenuAction(MenuAction action) {
      switch (action) {
        case MenuAction.share:
          // Implement share functionality
          break;
        case MenuAction.report:
          // Implement report functionality
          break;
        case MenuAction.bookmark:
          // Implement bookmark functionality
          break;
        case MenuAction.compare:
          // Implement compare functionality
          break;
        case MenuAction.visitWebsite:
          // Implement website visit functionality
          break;
      }
    }

    return MouseRegion(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: kpurple400,
                                    borderRadius: BorderRadius.circular(30))),
                            kWidth15,
                            const Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text('eie European Business School',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87)),
                                  kHeight10,
                                  Row(children: [
                                    Icon(Icons.location_on,
                                        size: 16, color: Colors.grey),
                                    kWidth5,
                                    Text('St. Julian\'s Malta',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))
                                  ])
                                ])),
                            PopupMenuButton<MenuAction>(
                                color: kWhite,
                                icon: const Icon(Icons.more_vert),
                                onSelected: handleMenuAction,
                                itemBuilder: (BuildContext context) => [
                                      const PopupMenuItem(
                                          value: MenuAction.share,
                                          child: Row(children: [
                                            Icon(Icons.share, size: 20),
                                            kWidth10,
                                            Text('Share')
                                          ])),
                                      const PopupMenuItem(
                                          value: MenuAction.report,
                                          child: Row(children: [
                                            Icon(Icons.flag, size: 20),
                                            kWidth10,
                                            Text('Report')
                                          ])),
                                      const PopupMenuItem(
                                          value: MenuAction.bookmark,
                                          child: Row(children: [
                                            Icon(Icons.bookmark_border,
                                                size: 20),
                                            kWidth10,
                                            Text('Bookmark')
                                          ])),
                                      const PopupMenuItem(
                                          value: MenuAction.compare,
                                          child: Row(children: [
                                            Icon(Icons.compare_arrows,
                                                size: 20),
                                            kWidth10,
                                            Text('Compare')
                                          ])),
                                      const PopupMenuItem(
                                          value: MenuAction.visitWebsite,
                                          child: Row(children: [
                                            Icon(Icons.language, size: 20),
                                            kWidth10,
                                            Text('Visit Website')
                                          ]))
                                    ])
                          ]),
                      kHeight15,
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Reviews',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                            kHeight5,
                            Row(
                                children: List.generate(
                                    5,
                                    (index) => const Icon(Icons.star,
                                        color: Colors.amber, size: 24)))
                          ]),
                      kHeight15,
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(children: [
                              Icon(
                                Icons.diamond,
                                color: Colors.green,
                                size: 20,
                              ),
                              kWidth5,
                              Text('Top ten Malta',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 14))
                            ]),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(4)),
                                child: const Text('Exclusive',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)))
                          ])
                    ]))));
  }
}
