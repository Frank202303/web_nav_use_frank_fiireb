import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';


import '../models/network/user_defaults.dart';
import '../network/http_caller.dart';
import '../values/string_manager.dart';

///  Define the name of the network request
///
enum ApiKey {
  testLocalhost,
  showUser,
  signUp,
  signIn,
  forgetPassword,
  updateUser,
  onboardingPreviousStep,
  statesByCountry,
  articleIndex,
  blogPageShow,
  deleteUserAvatar,
  blogsIndex,
  showHome,
  showDeal,
  dealsIndex,
  search,
  dealView,
  filters,
  appEvent,
  iosVersion,
  androidVersion,
  notificationList,
  notificationShow,
  readNotification,
  deleteAccount
}

///  Define the url of debug mode and production mode
class Apis {
  static String get baseUrl {
    if (kDebugMode) {
      return HAStrings.stagingApiURL;
    } else if (kProfileMode) {
      return HAStrings.stagingApiURL;
    } else {
      return HAStrings.productionApiURL;
    }
  }

  // static String baseUrl = HAStrings.postmanURL;
  ///
  /// Different requests use different URL
  static String path(ApiKey key, {String? id}) {
    switch (key) {
      case ApiKey.showUser:
        return '/v1/users';
      case ApiKey.testLocalhost:
        //TODO
        return '/v1/users';
      case ApiKey.signUp:
        return '/v1/auth';
      case ApiKey.signIn:
        return '/v1/auth/sign_in';
      case ApiKey.forgetPassword:
        return '/v1/auth/password';
      case ApiKey.updateUser:
        return '/v1/users';
      case ApiKey.onboardingPreviousStep:
        return '/v1/user-previous-onboarding-step';
      case ApiKey.statesByCountry:
        return '/v1/states_by_country';
      case ApiKey.blogPageShow:
        return '/v1/blogpage';
      case ApiKey.deleteUserAvatar:
        return '/v1/user-avatar';
      case ApiKey.articleIndex:
        return '/v1/articles';
      case ApiKey.blogsIndex:
        return '/v1/blogs';
      case ApiKey.showHome:
        return '/v1/homepage';
      case ApiKey.showDeal:
        return '/v1/deals';

      case ApiKey.dealsIndex:
        return '/v1/deals';
      case ApiKey.search:
        return '/v1/search';
      case ApiKey.dealView:
        return '/v1/events/deal_view';
      case ApiKey.filters:
        return '/v1/filters';
      case ApiKey.appEvent:
        return '/v1/events/app_event';
      case ApiKey.iosVersion:
        return '/v1/ios_version';
      case ApiKey.androidVersion:
        return '/v1/android_version';

      case ApiKey.deleteAccount:
        return '/v1/user-delete';
      case ApiKey.notificationShow:
        return '/v1/user_notifications/$id';
      case ApiKey.notificationList:
        return '/v1/user_notifications';
      case ApiKey.readNotification:
        return '/v1/user_notifications/$id?read=true';
    }
  }

  /// Different requests use different methods
  static String method(ApiKey key) {
    switch (key) {
      case ApiKey.testLocalhost:
        return 'GET';
      case ApiKey.showUser:
        return 'GET';
      case ApiKey.signUp:
        return 'POST';
      case ApiKey.signIn:
        return 'POST';
      case ApiKey.forgetPassword:
        return 'POST';
      case ApiKey.updateUser:
        return 'PUT';
      case ApiKey.onboardingPreviousStep:
        return 'PUT';
      case ApiKey.statesByCountry:
        return 'GET';
      case ApiKey.blogPageShow:
        return 'GET';
      case ApiKey.deleteUserAvatar:
        return 'DELETE';
      case ApiKey.articleIndex:
        return 'GET';
      case ApiKey.blogsIndex:
        return 'GET';
      case ApiKey.showHome:
        return 'GET';
      case ApiKey.showDeal:
        return 'GET';

      case ApiKey.dealsIndex:
        return 'GET';
      case ApiKey.search:
        return 'GET';
      case ApiKey.dealView:
        return 'POST';
      case ApiKey.filters:
        return 'GET';
      case ApiKey.appEvent:
        return 'POST';
      case ApiKey.iosVersion:
        return 'GET';
      case ApiKey.androidVersion:
        return 'GET';
      case ApiKey.deleteAccount:
        return 'DELETE';
      case ApiKey.notificationShow:
        return 'GET';
      case ApiKey.notificationList:
        return 'GET';
      case ApiKey.readNotification:
        return 'PUT';
    }
  }

  /// call request2 in HttpCaller
  static Future<Response> request3(ApiKey key, Map<String, dynamic>? params) async {
    if (key == ApiKey.updateUser && params?['avatar'] != null) {
      final avatarFile = params?['avatar'] as File;
      return MultipartFile.fromFile(avatarFile.path, filename: 'avatar').then((data) async {
        return HttpCaller.instance.request2(path(key), key,
            data: FormData.fromMap({'avatar': data}),
            params: null,
            options: Options(method: method(key), headers: await _sharedHeader()));
      });

      ///  has id
    } else if ((key == ApiKey.showDeal) && params?['id'] != null) {
      return HttpCaller.instance.request2(path(key) + "/${params?["id"]}", key,
          data: params,
          params: null,
          options: Options(method: method(key), headers: await _sharedHeader()));
    } else if ((key == ApiKey.notificationShow || key == ApiKey.readNotification) &&
        params?['notificationId'] != null) {
      return HttpCaller.instance.request2(path(key, id: params?["notificationId"].toString()), key,
          data: params,
          params: null,
          options: Options(method: method(key), headers: await _sharedHeader()));
    }

    /// other general request
    if (method(key) == 'GET') {
      /// GET: put  params in the url
      return HttpCaller.instance.request2(path(key), key,
          data: null,
          params: params,
          options: Options(method: method(key), headers: await _sharedHeader()));
    } else {
      /// POST...: put  params in the body
      return HttpCaller.instance.request2(path(key), key,
          data: params,
          params: null,
          options: Options(method: method(key), headers: await _sharedHeader()));
    }
  }

  /// Fill header with locally saved data
  static Future<Map<String, dynamic>> _sharedHeader() async {
    Map<String, dynamic> headers = {'Content-type': 'application/json'};
    headers['access-token'] = await UserDefaults.instance.getStringBy(UserInfo.accessToken);
    headers['client'] = await UserDefaults.instance.getStringBy(UserInfo.client);
    headers['token-type'] = await UserDefaults.instance.getStringBy(UserInfo.tokenType);
    headers['expiry'] = await UserDefaults.instance.getStringBy(UserInfo.expiry);
    headers['uid'] = await UserDefaults.instance.getStringBy(UserInfo.uid);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (UniversalPlatform.isIOS) {
      headers['X-PLATFORM'] = 'IOS';
      final info = await deviceInfo.iosInfo; // if run on the simulator, may show the info of Mac
      headers['X-DEVICE-MODEL'] = info.utsname
          .machine; // example: iPhone11,1  translation list: https://gist.github.com/adamawolf/3048717
      headers['X-SYSTEM-VERSION'] = info.systemVersion;
      headers['User-Agent'] =
          "HerBlackBook/${packageInfo.version} (${info.utsname.machine}; iOS ${info.systemVersion} Scale/2.00)";
    } else if (UniversalPlatform.isAndroid) {
      headers['X-PLATFORM'] = 'ANDROID';
      final info = await deviceInfo.androidInfo;
      headers['X-DEVICE-MODEL'] = info.model;
      headers['X-SYSTEM-VERSION'] = info.version;
      headers['User-Agent'] =
          "HerBlackBook/${packageInfo.version} (${info.model}; Android ${info.version} Scale/2.00)";
    }
    headers['X-APP-BUILD'] = packageInfo.buildNumber;
    headers['X-APP-VERSION'] = packageInfo.version;
    headers['X-USER-TIMEZONE'] = await FlutterNativeTimezone.getLocalTimezone();
    return headers;
  }
}
