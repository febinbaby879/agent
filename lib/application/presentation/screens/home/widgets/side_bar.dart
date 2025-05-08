import 'package:agent_dashboard/application/presentation/screens/home/home.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BuildSideBar extends StatelessWidget {
  const BuildSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text('Welcome',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700))),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF5D5FEF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.settings, color: Colors.white))),
          kHeight15,
          CircularPercentIndicator(
              radius: 80,
              lineWidth: 20,
              percent: 1.0,
              center: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('100%',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))
                  ]),
              progressColor: Colors.green,
              backgroundColor: Colors.green.withOpacity(0.2)),
          kHeight20,
          const Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            BuildSideBArItem(title: 'Wishlist Institutions'),
            BuildSideBArItem(title: 'Wishlist Courses'),
            BuildSideBArItem(title: 'Commissions'),
            BuildSideBArItem(title: 'Relationship Manager'),
            BuildSideBArItem(title: 'How we Work'),
            BuildSideBArItem(title: 'Whatsapp Link'),
            BuildSideBArItem(title: 'Video Tutorials'),
          ])))
        ]));
  }
}
