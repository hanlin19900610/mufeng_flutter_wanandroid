import 'package:provider/provider.dart'
    show SingleChildCloneableWidget, ChangeNotifierProvider;

import 'package:mufeng_flutter_wanandroid/view_model/local_model.dart';
import 'package:mufeng_flutter_wanandroid/view_model/theme_model.dart';
import 'package:mufeng_flutter_wanandroid/view_model/user_model.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  ChangeNotifierProvider<ThemeModel>.value(value: ThemeModel()),
  ChangeNotifierProvider<LocaleModel>.value(value: LocaleModel()),
  ChangeNotifierProvider<UserModel>.value(value: UserModel())
];

/// 需要依赖的model
List<SingleChildCloneableWidget> dependentServices = [
//  ProxyProvider<Api, AuthenticationService>(
//    builder: (context, api, authenticationService) =>
//        AuthenticationService(api: api),
//  )
];

List<SingleChildCloneableWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
];
