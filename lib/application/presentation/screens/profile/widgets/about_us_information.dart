import 'package:agent_dashboard/application/presentation/screens/profile/widgets/side_bar.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

class AboutUsInformation extends StatelessWidget {
  const AboutUsInformation({super.key, required this.isSmallScreen});

  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isSmallScreen
            ? AppBar(
                title: const Text('About Us'),
                backgroundColor: kWhite,
                foregroundColor: Colors.black,
              )
            : null,
        drawer: isSmallScreen
            ? const Drawer(child: SidebarWidget(maxWidth: 280))
            : null,
        body: const Center(
          child: Text('About us Information'),
        ));
  }
}
