import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/screens/authentication/forgot_password/forgot_password_screen.dart';
import 'package:learning_management_system/presentation/screens/authentication/forgot_password/success_send_email_screen.dart';
import 'package:learning_management_system/presentation/screens/authentication/sign_in/sign_in_user_name_screen.dart';
import 'package:learning_management_system/presentation/screens/authentication/sign_up/sign_up_username.dart';
import 'package:learning_management_system/presentation/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:learning_management_system/presentation/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:learning_management_system/presentation/resources/string_manager.dart';
import 'package:learning_management_system/presentation/widgets/navigationBar_widgets/home_page/widgets/all_categories.dart';
import '../screens/bottom_navigationBar/navigationBar_screen.dart';

class Routes {
  // NavigationBarScreen
  static const String navigationBar = '/';

  // Authentication
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';
  static const String signUpUserName = '/signUpUserName';
  static const String signInUserNameScreen = '/signInUserNameScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String successSendEmailScreen = '/successSendEmailScreen';

  // All categories
  static const String allCategories = '/categories';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.navigationBar:
        return MaterialPageRoute(builder: (_) => const NavigationBarScreen());
      case Routes.signUp:
        return CustomPageRoute(child: const SignUpScreen(), x: 0, y: 1);
      case Routes.signIn:
        return CustomPageRoute(child: const SignInScreen(), x: 0, y: 1);
      case Routes.signUpUserName:
        return CustomPageRoute(child: const SignUpUserNameScreen(), x: 0, y: 1);
      case Routes.signInUserNameScreen:
        return CustomPageRoute(child: const SignInUserNameScreen(), x: 0, y: 1);
      case Routes.forgotPasswordScreen:
        return CustomPageRoute(child: const ForgotPassword(), x: 0, y: 1);
      case Routes.successSendEmailScreen:
        return CustomPageRoute(child: const SuccessSendEmail(), x: 0, y: 1);
      case Routes.allCategories:
        return CustomPageRoute(child: const AllCategories());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStringNoRouteFound.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStringNoRouteFound.noRouteFound),
        ),
      ),
    );
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  double? x;
  double? y;
  CustomPageRoute({
    required this.child,
    this.x,
    this.y,
  }) : super(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.linear);
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(x ?? 1, y ?? 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
