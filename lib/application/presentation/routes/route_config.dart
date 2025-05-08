import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/screens/home/home.dart';
import 'package:agent_dashboard/application/presentation/screens/profile/profile.dart';
import 'package:agent_dashboard/domain/core/binding/auth_binding.dart';
import 'package:agent_dashboard/domain/core/binding/home_bindings.dart';
import 'package:get/get.dart';

class GetXRouterConfig {
  static final List<GetPage> routes = [
    GetPage(
        bindings: [AuthBinding()],
        name: Routes.profile,
        page: () => const ScreenProfile()),
    GetPage(
        bindings: [HomeBinding()],
        name: Routes.homeScreen,
        page: () => const HomeScreen()),
  ];
}
