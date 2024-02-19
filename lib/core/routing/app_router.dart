import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingPage:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );
    }
  }
}
