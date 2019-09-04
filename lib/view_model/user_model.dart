import 'package:mufeng_flutter_wanandroid/config/storage_manager.dart';
import 'package:mufeng_flutter_wanandroid/provider/view_state_model.dart';
import 'package:mufeng_flutter_wanandroid/model/user.dart';

class UserModel extends ViewStateModel{
  static const String kUser = 'kUser';

  User _user;

  User get user => _user;

  bool get hasUser => user != null;

  UserModel() {
    var userMap = StorageManager.localStorage.getItem(kUser);
    _user = userMap != null ? User.fromJsonMap(userMap) : null;
  }

  saveUser(User user) {
    _user = user;
    notifyListeners();
    StorageManager.localStorage.setItem(kUser, user);
  }

  /// 清除持久化的用户数据
  clearUser(){
    _user = null;
    notifyListeners();
    StorageManager.localStorage.deleteItem(kUser);
  }
}