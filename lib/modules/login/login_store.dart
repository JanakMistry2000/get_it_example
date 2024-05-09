import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get_it_example/main.dart';
import 'package:get_it_example/service_locator.dart';
import 'package:get_it_example/values/app_routes.dart';
import 'package:get_it_example/values/enumeration.dart';
import 'package:get_it_example/values/extensions.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  NetworkState apiState = NetworkState.idle;

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  late Timer timer;

  @observable
  String? qrCodeBase64;

  Future<void> loginWithEmailPassword() async {
    var apiResponse = await apiRepository.loginWithEmailPassword(
      userNameController.text.trim(),
      passwordController.text.trim(),
    );
    if (apiResponse.data != null) {
      sl.pushNewScope(scopeName: UserType.buyer.name);
      registerUser(apiResponse.data!);
      navigator.pushNamedAndRemoveUntil(
        AppRoutes.homeScreen,
        (route) => false,
      );
    } else {
      // TODO: Show error toast
    }
  }

  Future<void> loginWithQR() async {
    apiState = NetworkState.loading;
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      var apiResponse = await apiRepository.getLoginQR();
      if (apiResponse.data?.isNotEmpty ?? false) {
        qrCodeBase64 = apiResponse.data;
        apiState = NetworkState.success;
      } else if (apiResponse.code.isSuccessful) {
        timer.cancel();
        apiState = NetworkState.success;
      } else {
        timer.cancel();
        apiState = NetworkState.error;
      }
    });
  }

  /// This will remove the allocated resources and listeners in the class
  void removeResources() {
    timer.cancel();
  }
}
