import 'package:flutter/material.dart';
import 'package:get_it_example/routes.dart';
import 'package:get_it_example/service_locator.dart';

import 'modules/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

NavigatorState get navigator => navigatorKey.currentState!;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) =>
          Routes.generateRoute(
            settings,
            const HomeScreen(),
          ),
    );
  }
}
