/// Intercept the header of the network request and save it locally using SharedPreferences
///
import 'package:dio/dio.dart';
import '../network/user_defaults.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    UserDefaults.instance.setStringBy(UserInfo.accessToken,
        value: response.headers.value('access-token'));
    UserDefaults.instance
        .setStringBy(UserInfo.client, value: response.headers.value('client'));
    UserDefaults.instance.setString('date', response.headers.value('date'));
    UserDefaults.instance
        .setStringBy(UserInfo.uid, value: response.headers.value('uid'));
    UserDefaults.instance
        .setStringBy(UserInfo.expiry, value: response.headers.value('expiry'));
    UserDefaults.instance.setStringBy(UserInfo.tokenType,
        value: response.headers.value('token-type'));
    return super.onResponse(response, handler);
  }
}
