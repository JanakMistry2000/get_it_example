import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it_example/main.dart';
import 'package:get_it_example/modules/home/home_store.dart';
import 'package:get_it_example/service_locator.dart';
import 'package:get_it_example/values/app_routes.dart';
import 'package:get_it_example/values/enumeration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final homeStore = sl.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          if (homeStore.user.type == UserType.anonymous) ...{
            IconButton(
              onPressed: () => navigator.pushNamed(AppRoutes.loginScreen),
              icon: const Icon(Icons.login),
            ),
          } else ...{
            Row(
              children: [
                Text(homeStore.user.name),
                IconButton(
                  onPressed: () => navigator.pushNamed(AppRoutes.profileScreen),
                  icon: const Icon(Icons.account_circle),
                ),
              ],
            )
          }
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Observer(
                builder: (context) {
                  return Text(
                    'Welcome, ${homeStore.user.name}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w500),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
