import 'package:flutter/material.dart';
import 'package:get_it_example/main.dart';
import 'package:get_it_example/modules/profile/profile_store.dart';
import 'package:get_it_example/service_locator.dart';
import 'package:get_it_example/values/app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final profileStore = sl.get<ProfileStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.account_circle,
                  size: 50,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                profileStore.user.name,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: logoutUser,
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logoutUser() {
    sl.popScope();
    navigator.pushNamedAndRemoveUntil(AppRoutes.homeScreen, (route) => false);
  }
}
