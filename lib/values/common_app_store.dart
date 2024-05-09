import 'package:get_it_example/values/enumeration.dart';
import 'package:mobx/mobx.dart';

part 'common_app_store.g.dart';

class CommonAppStore = _CommonAppStore with _$CommonAppStore;

abstract class _CommonAppStore with Store {
  LanguageCode selectedLanguage = LanguageCode.en;

  void setLanguage(LanguageCode languageCode) {
    selectedLanguage = languageCode;
  }
}
