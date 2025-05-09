import 'package:agent_dashboard/application/presentation/routes/route_config.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/domain/core/binding/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AgentDashBoard());
}

class AgentDashBoard extends StatelessWidget {
  const AgentDashBoard({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp.router(
      routeInformationParser: GoRouterConfig.router.routeInformationParser,
      routeInformationProvider: GoRouterConfig.router.routeInformationProvider,
      routerDelegate: GoRouterConfig.router.routerDelegate,
      initialBinding: AllControllerBinding(),
      title: 'Agent',
      theme: ThemeData(
          fontFamily: 'Merriweather',
          primaryColor: kBluePrimary,
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: kWhite),
      debugShowCheckedModeBanner: false);
}
