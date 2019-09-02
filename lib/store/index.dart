import 'package:flutter/material.dart' show BuildContext;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, Consumer, Provider;

export 'package:provider/provider.dart';

class Store {
  static BuildContext context;
  static BuildContext widgetCtx;

  static init({context, child}) {
    return MultiProvider(
      providers: [],
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
