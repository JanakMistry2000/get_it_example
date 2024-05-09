import 'package:get_it/get_it.dart';
import 'package:get_it_example/apibase/api_repo.dart';
import 'package:get_it_example/models/user_info.dart';
import 'package:get_it_example/modules/home/home_store.dart';
import 'package:get_it_example/modules/login/login_store.dart';
import 'package:get_it_example/modules/profile/profile_store.dart';
import 'package:get_it_example/values/common_app_store.dart';
import 'package:get_it_example/values/enumeration.dart';

/// Global instance of get_it that will be used throughout the
/// app for access all the instances
final sl = GetIt.I;

ApiRepository get apiRepository => sl.get<ApiRepository>();

void setupServiceLocator() {
  /// Registering singleton for commonAppStore.
  /// This instance will be immediately created as we call the
  /// setupServiceLocator
  sl.registerSingleton(
    CommonAppStore(),
    dispose: (param) => param,
  );

  sl.registerSingleton(
    UserInfo(
      id: DateTime.timestamp().microsecondsSinceEpoch.toString(),
      name: 'Anonymous',
      type: UserType.anonymous,
    ),
  );

  sl.registerFactory(
    () => HomeStore(sl()),
  );

  sl.registerFactory(() => ProfileStore(sl()));

  sl.registerLazySingleton(() => ApiRepository());

  sl.registerFactory(() => LoginStore());
}

void registerUser(UserInfo user) {
  sl.registerSingleton<UserInfo>(user);
}

///

/// This function will unregister the loginStore instance
void unregisterLogin() {
  sl.unregister<LoginStore>(
    disposingFunction: (instance) => instance.removeResources(),
  );
}
