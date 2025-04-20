import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/screens/home/home.dart';
import 'package:agent_dashboard/application/presentation/screens/splash/splash.dart';
import 'package:agent_dashboard/domain/core/binding/auth_binding.dart';
import 'package:get/get.dart';

class GetXRouterConfig {
  static final List<GetPage> routes = [
    GetPage(
        bindings: [AuthBinding()],
        name: Routes.splashScreen,
        page: () => const SplashScreen()),
    GetPage(
        bindings: [AuthBinding()],
        name: Routes.homeScreen,
        page: () => const HomeScreen()),
  ];
}
