import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/APIs.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref);
});

class AuthRepository {
  final Ref _ref;

  AuthRepository(this._ref);

  Future<String?> getMinimalVersion() {
    return Apis.request3(ApiKey.androidVersion, null).then((response) {
      if (response.statusCode != 200) {
        return Future.value(null);
      }

      ///The type of the return value of dio is Map,
      ///which has been decoded,
      ///so you can directly use the key to get the value
      // // todo  android_version
      return Future.value(response.data['android_version']);
    });
  }

  Future<bool?> signin() {
    return Apis.request3(ApiKey.signIn, null).then((response) {
      if (response.statusCode != 200) {
        return Future.value(null);
      }

      ///The type of the return value of dio is Map,
      ///which has been decoded,
      ///so you can directly use the key to get the value
      return Future.value(true);
    });
  }
}
