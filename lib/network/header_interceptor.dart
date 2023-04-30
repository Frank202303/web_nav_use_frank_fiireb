/// Intercept the header of the network request and save it locally using SharedPreferences
///
import 'package:dio/dio.dart';
import 'package:universal_platform/universal_platform.dart';
import '../network/user_defaults.dart';

class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    UserDefaults.instance.setStringBy(UserInfo.accessToken,
        value: response.headers.value('access-token'));
    UserDefaults.instance
        .setStringBy(UserInfo.client, value: response.headers.value('client'));
      UserDefaults.instance.setString('date',  processDate(response.headers)) ;
    UserDefaults.instance
        .setStringBy(UserInfo.uid, value: response.headers.value('uid'));
    UserDefaults.instance
        .setStringBy(UserInfo.expiry, value: response.headers.value('expiry'));
    UserDefaults.instance.setStringBy(UserInfo.tokenType,
        value: response.headers.value('token-type'));
    return super.onResponse(response, handler);
  }
 String processDate(Headers headers){
    String date='';
    if(UniversalPlatform.isIOS  ||UniversalPlatform.isAndroid ){
      date= headers.value('date')??  (DateTime.now()).toString();

    }else{
      // web
      if(headers['date']!=null){
        date=headers['date'].toString();
      }else{
        date= (DateTime.now()).toString();
      }
    }
    return date;
  }
}
