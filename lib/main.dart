import 'package:flutter/material.dart';
import 'package:mufeng_flutter_wanandroid/store/index.dart' show Store;

import 'page/first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('根部构建: $context');
    return Store.init(
      context: context,
      child: MaterialApp(
        title: 'Provider',
        home: Builder(
          builder: (context) {
            Store.widgetCtx = context;
            print('widgetCtx: $context');
            return FirstPage();
          },
        ),
      )
    );
  }
}