import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/screens/auth/forgot_password_.dart';
import 'package:agent_dashboard/application/presentation/screens/auth/widgets/agreement_screen.dart';
import 'package:agent_dashboard/application/presentation/screens/auth/login_screen.dart';
import 'package:agent_dashboard/application/presentation/screens/auth/splash_screen.dart';
import 'package:agent_dashboard/application/presentation/screens/home/home.dart';
import 'package:agent_dashboard/application/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:agent_dashboard/application/presentation/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfig {
  static final router = GoRouter(
      initialLocation: '/',
      routes: routes,
      errorBuilder: (context, state) => _errorScreen());
  static final List<RouteBase> routes = [
    GoRoute(
        path: Routes.initial, builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: Routes.login, builder: (context, state) => const ScreenLogin()),
    GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => const ScreenForgorPassword()),
    GoRoute(
        path: Routes.profile,
        builder: (context, state) => const ScreenProfile()),
    GoRoute(
        path: Routes.homeScreen,
        builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: Routes.agrementSign,
        builder: (context, state) => const ScreenAgrementSignature()),
    GoRoute(
        path: Routes.onboardingScreen,
        builder: (context, state) => const ScreenOnboarding()),
  ];
  static _errorScreen() => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      );
}
