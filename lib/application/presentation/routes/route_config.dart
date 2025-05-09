import 'package:agent_dashboard/application/presentation/routes/routes.dart';
import 'package:agent_dashboard/application/presentation/screens/auth/agreement_screen.dart';
import 'package:agent_dashboard/application/presentation/screens/home/home.dart';
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
        path: Routes.profile,
        builder: (context, state) => const ScreenProfile()),
    GoRoute(
        path: Routes.homeScreen,
        builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: Routes.signatureTest,
        builder: (context, state) => const ScreenSignatureTest()),
  ];
  static _errorScreen() => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      );
}
