import 'package:get_it_example/values/enumeration.dart';

class UserInfo {
  UserInfo({
    required this.id,
    required this.name,
    required this.type,
  });

  final String id;
  final String name;
  final UserType type;
}
