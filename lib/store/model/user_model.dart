import 'package:flutter/foundation.dart' show ChangeNotifier;
import '../object/user_info.dart';
export '../object/user_info.dart';

class UserModel extends UserInfo with ChangeNotifier {
  UserInfo _userInfo = UserInfo(name: 'MuFeng');

  String get name => _userInfo.name;

  void setName(name) {
    _userInfo.name = name;
    notifyListeners();
  }
}
