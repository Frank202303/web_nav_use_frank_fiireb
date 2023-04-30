import 'dart:convert' show json;

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


import '../models/ha_error_entity.dart';
import '../network/pf_toast.dart';
import '../network/retry_on_connection_interceptor.dart';
import '../routes/app_routes.dart';
import '../routes/router_delegate.dart';
import 'APIs.dart';
import 'header_interceptor.dart';

class HttpCaller {
  static final HttpCaller instance = HttpCaller._internal();

  factory HttpCaller() => instance;

  HttpCaller._internal();

  static BaseOptions options = BaseOptions(
    baseUrl: Apis.baseUrl,
    connectTimeout: Duration(seconds: 15),
    receiveTimeout: Duration(seconds: 15),
    validateStatus: (status) {
      return true;
    },
  );

  /// When requesting the API, the loading icon is not displayed
  final notShowHudKeys = [
    ApiKey.showHome,
    ApiKey.showUser,
    ApiKey.updateUser,
    ApiKey.blogsIndex,
    ApiKey.blogPageShow,
    ApiKey.articleIndex,
    ApiKey.dealsIndex,
    ApiKey.search,
    ApiKey.showDeal,
    ApiKey.dealView,
    ApiKey.appEvent,
    ApiKey.iosVersion,
    ApiKey.androidVersion
  ];
  static var dio = Dio(HttpCaller.options);
  var _headerReader = HeaderInterceptor();
  var _retryInterceptor = RetryOnConnectionChangeInterceptor();

  void _interceptors() {
    if (!dio.interceptors.contains(_headerReader)) {
      dio.interceptors.add(_headerReader);
    }
    if (!dio.interceptors.contains(_retryInterceptor)) {
      dio.interceptors.add(_retryInterceptor);
    }
  }

  bool _willShowEasyLoading(ApiKey key) {
    return !notShowHudKeys.contains(key);
  }

  Future<Response> request2(String path, ApiKey key,
      {dynamic data, Map<String, dynamic>? params, Options? options}) async {
    _interceptors();
    if (_willShowEasyLoading(key)) {
      // determine which api needs EasyLoading
      if (!EasyLoading.isShow) {
        EasyLoading.show();
      }
    }

    /// Finally, we finally call the api request data
    /// Finally, we finally call the api request data
    /// Finally, we finally call the api request data
    return dio
        .request(
      'https://staging.herblackbook.com/api/v1/android_version',
      data: {},
      options: Options(method: 'GET'),


    )
        .then((response) {
      if (_willShowEasyLoading(key)) {
        // determine which api needs EasyLoading

        EasyLoading.dismiss();
      }

      /// handle error， when statusCode is not 200
      if (response.statusCode! < 200 || response.statusCode! > 299) {
        if (response.statusCode == 401 &&
            HARouterDelegate.instance.isMainTabExisting()) {
          HARouterDelegate.instance.logout();
        }
        if (response.statusCode == 403) {
          // HARouterDelegate.instance
          //     .push(HARouterDelegate.instance.push(HARoutePath.login()));
        }
        try {
          /// json file to json Object
          var jsonObject = json.decode(response.data);
          // use json Object(Map) to instantiate
          HAErrorEntity error = HAErrorEntity.fromJson(jsonObject);
          if (error.errors != null) {
            String errorString =
                error.errors!.reduce((value, element) => "$value\n$element");
            errorString.replaceFirst("\n", "");

            ///Sign in and Sign up Page and ResetPassword error messages are displayed inside the page.
            final keysNotShowToast = [
              ApiKey.signIn,
              ApiKey.signUp,
              ApiKey.forgetPassword,
            ];
            if (!keysNotShowToast.contains(key)) {
              PFToast.showToast(errorString);
            }
          }
        } catch (error) {
          PFToast.showToast("Error code ${response.statusCode}");
        }
      }

      /// handle normal， when statusCode is 200
      return response;
    });
  }
}
