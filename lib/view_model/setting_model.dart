import 'package:flutter/cupertino.dart';
import 'package:mufeng_flutter_wanandroid/config/storage_manager.dart';

const String kUseWebViewPlugin = 'kUseWebViewPlugin';

class UseWebViewPluginModel extends ChangeNotifier {
  get value =>
      StorageManager.sharedPreferences.getBool(kUseWebViewPlugin) ?? false;

  switchValue() {
    StorageManager.sharedPreferences.setBool(kUseWebViewPlugin, !value);
    notifyListeners();
  }
}
