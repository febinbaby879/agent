import 'package:agent_dashboard/application/presentation/routes/route_config.dart';
import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const AgentDashBoard());
}

class AgentDashBoard extends StatelessWidget {
  const AgentDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
          title: 'Agent',
          theme: ThemeData(
              primaryColor: kBluePrimary,
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: kGreyLightBackground,
              textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: kBlack,
                  displayColor: kBlack,
                  fontFamily: 'Poppins')),
          getPages: GetXRouterConfig.routes,
          initialRoute: Routes.homeScreen,
          debugShowCheckedModeBanner: false),
    );
  }
}
