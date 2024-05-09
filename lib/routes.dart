import 'package:flutter/material.dart';
import 'package:get_it_example/modules/home/home_screen.dart';
import 'package:get_it_example/modules/login/login_screen.dart';
import 'package:get_it_example/modules/profile/profile_screen.dart';
import 'package:get_it_example/values/app_routes.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings, Widget root) {
    MaterialPageRoute createRoute(Widget widget) {
      FocusManager.instance.primaryFocus?.unfocus();
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => widget,
      );
    }

    switch (settings.name) {
      case AppRoutes.root:
        return createRoute(root);
      case AppRoutes.homeScreen:
        return createRoute(const HomeScreen());
      case AppRoutes.loginScreen:
        return createRoute(const LoginScreen());
      case AppRoutes.profileScreen:
        return createRoute(const ProfileScreen());
      default:
        return createRoute(root);
    }
  }
}
