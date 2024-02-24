import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:doc_app/features/auth/presentation/pages/login_page.dart';
import 'package:doc_app/features/auth/presentation/pages/signup_page.dart';
import 'package:doc_app/features/home/presentation/pages/home_page.dart';
import 'package:doc_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:doc_app/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingPage:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case Routes.signUpPage:
        return MaterialPageRoute(
          builder: (_) => const SignupPage(),
        );
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.forgotPasswordPage:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordpage(),
        );
      case Routes.splashPage:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
    }
  }
}
