import 'package:get_it_example/models/user_info.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {

  _HomeStore(this.user);

  @observable
  UserInfo user;

}
