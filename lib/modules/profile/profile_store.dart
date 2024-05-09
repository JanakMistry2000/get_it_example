import 'package:get_it_example/models/user_info.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {

  _ProfileStore(this.user);

  @observable
  UserInfo user;

}
