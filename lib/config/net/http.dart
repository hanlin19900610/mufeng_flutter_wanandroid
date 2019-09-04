import 'dart:convert';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:mufeng_flutter_wanandroid/utils/platform_utils.dart';
import 'package:mufeng_flutter_wanandroid/config/storage_manager.dart';

import 'api.dart';

final Http http = Http();

class Http extends Dio {
  static Http instance;

  factory Http() {
    if (instance == null) {
      instance = Http._().._init();
    }
    return instance;
  }

  Http._();

  ///初始化 加入app通用处理
  _init() {
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors
    //基础设置
    ..add(HeaderInterceptor())
    // JSON处理
    ..add(ApiInterceptor())
    // cookie 持久化 异步
    ..add(CookieManager(PersistCookieJar(dir: StorageManager.temporaryDirectory.path)));
  }
}

_parseAndDecode(String response){
  return jsonDecode(response);
}

parseJson(String text){
  return compute(_parseAndDecode, text);
}

///添加常用Header
class HeaderInterceptor extends InterceptorsWrapper {

  @override
  onRequest(RequestOptions options) async{
    options.connectTimeout = 1000 * 45;
    options.receiveTimeout = 1000 * 45;

    var appVersion = await PlatformUtils.getAppVersion();
    var version = Map()
    ..addAll({
      'appVersion': appVersion
    });
    options.headers['version'] = version;
    options.headers['platform'] = PlatformUtils.getPlatform();
    return options;
  }
}