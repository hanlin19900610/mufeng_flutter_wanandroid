import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'storage_manager.dart';
import 'package:mufeng_flutter_wanandroid/ui/widget/page_route_anim.dart';
import 'package:mufeng_flutter_wanandroid/view_model/setting_model.dart';

import 'package:mufeng_flutter_wanandroid/ui/page/splash_page.dart';

class RouteName {
  static const String splash = 'splash';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case RouteName.splash:
        return NoAnimRouteBuilder(SplashPage());
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
    }
  }
}