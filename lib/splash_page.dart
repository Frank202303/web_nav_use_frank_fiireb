/// The first page loaded when the app is running
///
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'package:web_nav_use_frank_fiireb/values/color_manager.dart';
import 'package:web_nav_use_frank_fiireb/values/image_manager.dart';


import '../../../../routes/app_routes.dart';
import '../../../../routes/router_delegate.dart';
import 'auth/authentication_controller.dart';


class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  /// Obtain the minimum version of the CMS settings from the server,
  /// and determine whether the current version of the app needs to be upgraded.
  Future<void> initializeData() async {
    Future.delayed(const Duration(seconds: 1), () async {
    // await ref.read(authStateProvider.notifier).isNeedUpdateVersion();
    });
  }

  @override
  void initState() {
    super.initState();

    initializeData();
     getHttp();
  }




    void getHttp() async {
      final dio = Dio();
      final response = await dio.get('https://dart.dev');
      print("getHttp: "+response.toString());
    }



  ///  https://staging.herblackbook.com/api/v1/android_version
  tryNet() async {
    Uri url = Uri(
      scheme: 'https',
      host: 'staging.herblackbook.com',
      path: 'api/v1/android_version',
    );

    var result = await http.get(url);

    /// this result is json file, need to decode
    /// then we can get Map
    debugPrint('result:  ' + json.decode(result.body).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HAColors.haBlue,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Splash Page'),
        leading: const Text(''),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HAImage(
              HAMediaNames.haLogo,
              width: 100,
            ),
            ElevatedButton(
              onPressed: () {
                HARouterDelegate.instance.push(HARoutePath.mainTab());
              },
              child: const Text(
                'if logged in',
              ),
              key: const Key('loggedinKey'),
            ),
          ],
        ),
      ),
    );
  }
}
