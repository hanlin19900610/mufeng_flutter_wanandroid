import 'package:flutter/material.dart' show BuildContext;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, Consumer, Provider;

export 'package:provider/provider.dart';
import 'model/index.dart' show UserModel;
export 'model/index.dart';
export 'package:provider/provider.dart';

class Store {
  static BuildContext context;
  static BuildContext widgetCtx;

  static init({context, child}) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => UserModel()),
      ],
      child: child,
    );
  }

  static T value<T>(context) {
    return Provider.of(context);
  }

  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}
