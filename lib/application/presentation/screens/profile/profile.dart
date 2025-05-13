import 'package:agent_dashboard/application/presentation/screens/profile/widgets/profile_content.dart';
import 'package:agent_dashboard/application/presentation/screens/profile/widgets/side_bar.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        ;
        bool isSmallScreen = constraints.maxWidth < 600;
        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (!isSmallScreen)
            SidebarWidget(maxWidth: constraints.maxWidth * 0.3),
          Expanded(child: ProfileContent(isSmallScreen: isSmallScreen))
        ]);
      })));
}
