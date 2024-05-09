import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it_example/main.dart';
import 'package:get_it_example/modules/login/login_store.dart';

import 'package:get_it_example/service_locator.dart';
import 'package:get_it_example/values/enumeration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final store = sl.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: store.userNameController,
              decoration: const InputDecoration(
                hintText: 'Username/Email-id',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: store.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: store.loginWithEmailPassword,
              child: const Text('Login'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: loginWithQRDialog,
              child: const Text('Login with QR'),
            ),
            ElevatedButton(
              onPressed: () => unregisterLogin(),
              child: const Text('Unregister'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginWithQRDialog() async {
    store.loginWithQR();
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        child: SizedBox(
          height: 350,
          child: Column(
            children: [
              Expanded(
                child: Observer(
                  builder: (context) {
                    return store.qrCodeBase64?.isNotEmpty ?? false
                        ? Image.memory(
                            const Base64Decoder().convert(
                              store.qrCodeBase64!.split(',').last,
                            ),
                          )
                        : Center(
                            child: store.apiState == NetworkState.loading
                                ? const CircularProgressIndicator()
                                : const Text('Something went wrong!'));
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  store.timer.cancel();
                  navigator.pop(context);
                },
                child: const Text('Cancel'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
